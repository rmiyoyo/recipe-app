FactoryBot.define do
  factory :inventory do
    name { 'Eget Lorem' }
    description { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
    association :user, factory: :user
  end
end
