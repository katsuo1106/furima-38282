require 'rails_helper'

RSpec.describe BuyerShoppingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shopping_address = FactoryBot.build(:buyer_shopping_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報の登録' do
    context '商品購入情報を登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@buyer_shopping_address).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @buyer_shopping_address.building_name = ''
        expect(@buyer_shopping_address).to be_valid
      end
    end

    context '商品購入情報を登録できないとき' do
      it 'post_codeが空では登録できない' do
        @buyer_shopping_address.post_code = ''
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがハイフン無しでは登録できない' do
        @buyer_shopping_address.post_code = '1234567'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが半角英数混合では登録できない' do
        @buyer_shopping_address.post_code = '111-aaaa'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角では登録できない' do
        @buyer_shopping_address.post_code = '１２３-４５６７'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'area_idが1では登録できない' do
        @buyer_shopping_address.area_id = 1
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @buyer_shopping_address.city = ''
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @buyer_shopping_address.address = ''
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @buyer_shopping_address.phone_number = ''
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁では登録できない' do
        @buyer_shopping_address.phone_number = '090123456'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁では登録できない' do
        @buyer_shopping_address.phone_number = '090123456789'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角英数混合では登録できない' do
        @buyer_shopping_address.phone_number = '090aaaa1234'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角では登録できない' do
        @buyer_shopping_address.phone_number = '０９０１２３４５６７８'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では保存できない' do
        @buyer_shopping_address.token = ' '
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Token can't be blank")
      end
  
  
  
  
  end
end
end