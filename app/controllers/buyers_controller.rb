class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create] 
  before_action :move_to_index, only: [:index, :create]

  def index
    @buyer_shopping_address = BuyerShoppingAddress.new
  end

  def create
    @buyer_shopping_address = BuyerShoppingAddress.new(buyer_params)
    if @buyer_shopping_address.valid?
      pay_item
      @buyer_shopping_address.save
      redirect_to root_path
    else
      render :index
    end   
  end

  private

  def buyer_params
    params.require(:buyer_shopping_address).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
