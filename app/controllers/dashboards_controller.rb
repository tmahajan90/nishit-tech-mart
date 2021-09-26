class DashboardsController < ApplicationController
  def index
    @items = Item.all
    @availableItems = @items.sum(:quantity) - Order.count
    @bookedItems = Order.count
    @todays_delivery = Order.where(delivery_on: Date.today)
  end
end
