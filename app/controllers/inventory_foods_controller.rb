class InventoryFoodsController < ApplicationController
  before_action :set_inventory

  def new
    @inventory_food = InventoryFood.new
  end

  def create
    food_id = inventory_food_params[:food_id]
    existing_food = @inventory.inventory_foods.find_by(food_id:)

    if existing_food
      existing_food.quantity += inventory_food_params[:quantity].to_i
      if existing_food.save
        redirect_to inventory_path(@inventory), notice: 'Successfully updated the quantity of the food.'
      else
        redirect_to inventory_path(@inventory), alert: 'Failed to update the quantity of the food.'
      end
    else
      @inventory_food = @inventory.inventory_foods.build(inventory_food_params)
      if @inventory_food.save
        redirect_to inventory_path(@inventory), notice: 'Successfully added the food.'
      else
        render :new
      end
    end
  end

  def destroy
    @inventory_food = @inventory.inventory_foods.find_by(food_id: params[:inventory_food][:food_id])
    if @inventory_food
      @inventory_food.destroy
      redirect_to inventory_path(@inventory), notice: 'Successfully removed the food.'
    else
      redirect_to inventory_path(@inventory), alert: 'The food was not found in the inventory.'
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
