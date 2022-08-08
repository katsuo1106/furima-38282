class BuyerShoppingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address

    validates :phone_number
  end

  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer_id)
  end
end