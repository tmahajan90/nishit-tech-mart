class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :get_vehicle_types, only: [:new, :edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    params[:item][:remaining_quantity] = params[:item][:quantity]
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_url, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_url, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def get_vehicle_types
    @vehicle_types = VehicleType.all
  end

  def item_params
    params.require(:item).permit(:vehicle_type_id, :received_on, :quantity, :description, :remaining_quantity)
  end
end
