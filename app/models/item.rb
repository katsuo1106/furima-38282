class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :delivery_day


  belongs_to :user
  has_one :buyer

  has_one_attached :image

  validates :user, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :postage_id, presence: true, numericality: { other_than: 1 }
  validates :area_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true

end
