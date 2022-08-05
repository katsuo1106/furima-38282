class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :condition_id, :postage_id, :area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

    

end
