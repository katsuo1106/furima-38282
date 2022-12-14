FactoryBot.define do
  factory :user do
    nickname              { 'カツヲ' }
    email                 { Faker::Internet.free_email }
    password              { 'q111111' }
    password_confirmation { 'q111111' }
    last_name             { '磯野' }
    first_name            { '拓也' }
    last_name_kana        { 'イソノ' }
    first_name_kana       { 'タクヤ' }
    birthday              { '19861106' }
  end
end
