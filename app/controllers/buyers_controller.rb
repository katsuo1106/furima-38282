class BuyersController < ApplicationController

  def index
    @buyer_shopping_address = BuyerShoppingAddress.new
  end
end
