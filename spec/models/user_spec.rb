require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Gini') }
  before { user.save }

  it 'should be invalid if the name is not present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should have many associated recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq :has_many
  end

  it 'should have many associated inventories' do
    association = described_class.reflect_on_association(:inventories)
    expect(association.macro).to eq :has_many
  end
end
