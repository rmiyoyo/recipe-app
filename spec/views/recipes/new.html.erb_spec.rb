require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'doe', email: 'test@example.com', password: 'password') }
  describe 'Testing createing new recipe' do
    before :each do
      sign_in user
      visit new_recipe_path
    end

    context 'When creating a new recipe' do
      it 'should see the recipe name' do
        fill_in 'Name',	with: 'Lorem'
        fill_in 'Preparation Time',	with: 3
        fill_in 'Cooking Time',	with: 2
        fill_in 'Description',	with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
        find('#recipe_public_true').click
        click_button 'Create'
        expect(page).to have_text('Lorem')
        expect(page).to have_text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
        expect(current_path).to eq(recipes_path)
      end
    end
  end
end
