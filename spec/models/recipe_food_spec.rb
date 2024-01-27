require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'doe', email: 'test@example.com', password: 'password') }

  before :each do
    @recipe = Recipe.create(name: 'Lorem', preparation_time: 20, cooking_time: 10, description: 'this is how',
                            public: false, user:)
    @food = Food.create(name: 'LoremLorem', measurement_unit: 'g', price: 30)
    @food2 = Food.create(name: 'LoremLoremLorem', measurement_unit: 'unit', price: 30)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 32)
    @recipe_food2 = RecipeFood.create(recipe: @recipe, food: @food2, quantity: 32)
    @totalvalue = @recipe_food.quantity * @food.price
    @totalvalue2 = @recipe_food2.quantity * @food2.price
  end

  context 'When creating a new recipe_food' do
    it 'quantity should not be blank' do
      @recipe_food.quantity = nil
      expect(@recipe_food).not_to be_valid
    end

    it 'quantity should not be negative' do
      @recipe_food.quantity = -12
      expect(@recipe_food).not_to be_valid
    end

    it 'without belongs_to associations, it should be invalid' do
      @recipe_food.food = nil
      expect(@recipe_food).not_to be_valid
    end

    it 'should increment the recipes foodcounter' do
      expect(@recipe.foodcounter).to be 2
    end

    it 'should increment the recipes_food totalvalue' do
      expect(@recipe_food.totalvalue).to be @totalvalue
    end

    it 'should change the recipes totalvaluecounter' do
      value = @totalvalue + @totalvalue2
      expect(@recipe.totalvaluecounter).to be value
    end
  end
end
