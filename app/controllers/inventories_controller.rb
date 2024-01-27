class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
    if @inventory.save
      redirect_to inventories_path, notice: 'Successfully created a new inventory.'
    else
      flash.now[:alert] = 'Oops! Something went wrong while trying to create the inventory.'
      puts @inventory.errors.full_messages
      puts "Parameters for the inventory: #{inventory_params}"
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    if @inventory.user == current_user
      @inventory.inventory_foods.destroy_all

      @inventory.destroy

      redirect_to inventories_path, notice: 'Inventory has been successfully deleted.'
    else
      redirect_to inventories_path, alert: 'You lack the necessary permission to delete this inventory.'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
