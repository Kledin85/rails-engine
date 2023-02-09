FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.between(from: 1, to: 100) }
    unit_price { Faker::Number.within(range: 0.5..100.00)}
    association :item, factory: :item
    association :invoice, factory: :invoice
  end
end