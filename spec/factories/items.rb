FactoryBot.define do
  factory :item do
    item_name { 'アイテム' }
    item_description { 'アイテム説明' }
    category_id     { '2' }
    condition_id    { '2' }
    postage_id      { '2' }
    area_id         { '2' }
    delivery_day_id { '2' }
    price           { '300' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
