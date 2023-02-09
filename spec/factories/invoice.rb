FactoryBot.define do
  factory :invoice do
    status { Faker::Subscription.status}
    association :merchant_id, factory: :merchant
    association :customer, factory: :customer
  end
end