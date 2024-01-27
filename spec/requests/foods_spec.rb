require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /new' do
    let(:user) { User.create(name: 'Doe', email: 'test@example.com', password: 'password') }

    before :each do
      sign_in user
      get new_food_path
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the New template' do
      expect(response).to render_template(:new)
    end
  end
end
