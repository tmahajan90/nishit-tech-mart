class DashboardsController < ApplicationController
  def index
    # @dashboards = Dashboard.all
    @orders = Order.all
    @members = Member.all
    @items = Item.all
    @active = Order.today?
    @expired = Order.expired?
  end
end
