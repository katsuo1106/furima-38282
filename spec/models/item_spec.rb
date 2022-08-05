require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe "商品情報の保存" do
  context "商品情報を保存できる場合" do
    it "item_name、item_description、category_id、condition_id、postage_id,area_id, delivery_day_id, price, imageが存在すれば保存できる" do
      expect(@item).to be_valid
    end
  end

  context "商品情報保存ができない場合" do
    it "item_nameが空だと保存できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "item_descriptionが空だと保存できない" do
      @item.item_description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end
    it "category_idが空だと保存できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "condition_idが空だと保存できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "postage_idが空だと保存できない" do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it "area_idが空だと保存できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "delivery_day_idが空だと保存できない" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end
    it "priceが空だと保存できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "imageが空だと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "priceが299だと保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000だと保存できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceが全角数字だと保存できない" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "userが紐付いていなければ出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist", "User can't be blank")
    end
    
  end

end

end
