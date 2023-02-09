FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Quote.yoda }
    unit_price { Faker::Number.within(range: 0.5..100.00)}
    association :merchant, factory: :merchant
  end
end