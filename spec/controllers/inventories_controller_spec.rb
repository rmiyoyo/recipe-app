require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:test_user) { create(:user) }

  describe 'GET #index' do
    it 'should assign all inventories to the instance variable @inventories' do
      user = create(:user)
      inventory = create(:inventory, user: user)
      sign_in(user)

      get :index
      expect(assigns(:inventories)).to eq([inventory])
    end
  end

  describe 'GET #show' do
    it 'should assign the requested inventory to the instance variable @inventory' do
      user = create(:user)
      inventory = create(:inventory, user: user)
      sign_in(user)

      get :show, params: { id: inventory.id }
      expect(assigns(:inventory)).to eq(inventory)
    end

    it 'should render the template :show' do
      user = create(:user)
      inventory = create(:inventory, user: user)
      sign_in(user)

      get :show, params: { id: inventory.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'should assign a new inventory to the instance variable @inventory' do
      user = create(:user)
      sign_in(user)

      get :new
      expect(assigns(:inventory)).to be_a_new(Inventory)
    end

    it 'should render the template :new' do
      user = create(:user)
      sign_in(user)

      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'should create a new inventory' do
        inventory_attributes = attributes_for(:inventory)
        user = create(:user)
        sign_in(user)
        expect do
          post :create, params: { inventory: inventory_attributes }
        end.to change(Inventory, :count).by(1)
      end

      it 'should redirect to the inventories index page' do
        inventory_attributes = attributes_for(:inventory)
        user = create(:user)
        sign_in(user)
        post :create, params: { inventory: inventory_attributes }
        expect(response).to redirect_to(inventories_path)
      end
    end

    context 'with invalid attributes' do
      it 'should not create a new inventory' do
        user = create(:user)
        sign_in(user)
        expect do
          post :create, params: { inventory: { name: nil } }
        end.not_to change(Inventory, :count)
      end

      it 'should re-render the template :new' do
        user = create(:user)
        sign_in(user)
        post :create, params: { inventory: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    it 'should delete the inventory' do
      inventory = create(:inventory, user: user)
      sign_in(user)
      expect do
        delete :destroy, params: { id: inventory.id }
      end.to change(Inventory, :count).by(-1)
    end

    it 'should redirect to the inventories index page' do
      inventory = create(:inventory, user: user)
      sign_in(user)
      delete :destroy, params: { id: inventory.id }
      expect(response).to redirect_to(inventories_path)
    end
  end
end
