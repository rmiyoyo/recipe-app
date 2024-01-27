require 'rails_helper'

RSpec.describe 'RecipesFoods', type: :request do
  let(:user) { User.create(name: 'Doe', email: 'test@example.com', password: 'password') }
  let(:recipe) do
    Recipe.create(name: 'Delicious Dish', preparation_time: 20, cooking_time: 10, description: 'This is how',
                  public: false, user: user)
  end

  describe 'GET /recipes/:recipe_id/recipes_foods/new' do
    before :each do
      sign_in user
      get new_recipe_recipes_food_path(recipe_id: recipe)
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the New template' do
      expect(response).to render_template(:new)
    end
  end
end
