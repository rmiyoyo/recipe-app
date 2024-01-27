FactoryBot.define do
  factory :inventory_food do
    association :inventory
    association :food
    quantity { 4 }
  end
end
