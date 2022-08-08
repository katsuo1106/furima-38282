class ShoppingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer
  belongs_to :area
end
