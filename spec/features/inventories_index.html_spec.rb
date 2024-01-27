require 'rails_helper'

RSpec.feature 'Inventories Page' do
  scenario 'A client clicks on the inventories link' do
    user = create(:user)
    inventories = create_list(:inventory, 4, user:)

    login_as(user, scope: :user)

    visit inventories_path

    expect(page).to have_content('Inventories')

    inventories.each do |inventory|
      expect(page).to have_content(inventory.name)
      expect(page).to have_content(inventory.description)
    end

    expect(page).to have_selector('.btn-danger', count: inventories.count)
  end
end
