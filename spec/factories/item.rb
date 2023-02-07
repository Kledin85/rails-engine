FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { "This is the Description" }
    unit_price { Faker::Number.within(range: 0.5..100.00)}
    association :merchant_id, factory: :merchant
  end
end