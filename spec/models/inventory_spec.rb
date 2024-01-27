require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) { User.create(name: 'John') }

  it 'is considered invalid without a name' do
    inventory = Inventory.new(
      user: user
    )
    expect(inventory).not_to be_valid
  end

  it 'is considered invalid without a user_id' do
    inventory = Inventory.new(
      name: 'Sample Inventory'
    )
    expect(inventory).not_to be_valid
  end

  it 'is considered invalid if the name exceeds the maximum length' do
    inventory = Inventory.new(
      name: 'A' * 256,
      user: user
    )
    expect(inventory).not_to be_valid
  end
end
