require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'JohnDoe')
    @recipe = Recipe.new(name: 'Delicious Dish', preparation_time: 20, cooking_time: 10, description: 'This is how',
                         public: false, user: @user)
  end

  context 'When creating a new recipe' do
    it 'should be invalid if name is blank' do
      @recipe.name = nil
      expect(@recipe).not_to be_valid
    end

    it 'should be invalid if name length is not between 1 and 100' do
      @recipe.name = 'a' * 120
      expect(@recipe).not_to be_valid
    end

    it 'should be invalid if preparation_time is blank' do
      @recipe.preparation_time = nil
      expect(@recipe).not_to be_valid
    end

    it 'should be invalid if cooking_time is blank' do
      @recipe.cooking_time = nil
      expect(@recipe).not_to be_valid
    end

    it 'should be invalid if description is blank' do
      @recipe.description = nil
      expect(@recipe).not_to be_valid
    end

    it 'should be invalid if public is blank' do
      @recipe.public = nil
      expect(@recipe).not_to be_valid
    end
  end
end
