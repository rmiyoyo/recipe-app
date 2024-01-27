require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { Food.new(name: 'apple', measurement_unit: 'grams', price: 5) }
  before { food.save }

  it 'should establish a has_many association with Inventory foods' do
    association = described_class.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq :has_many
  end

  it 'should establish a has_many association with Recipe foods' do
    association = described_class.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq :has_many
  end

  it 'is invalid without a name' do
    food.name = nil
    expect(food).to_not be_valid
  end

  it 'is invalid without a measurement unit' do
    food.measurement_unit = nil
    expect(food).to_not be_valid
  end

  it 'is invalid without a price' do
    food.price = nil
    expect(food).to_not be_valid
  end
end
