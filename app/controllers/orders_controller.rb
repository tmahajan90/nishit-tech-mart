class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :set_data, only: [:new, :edit]
  # before_action :force_json, only: :search


  def index
    @orders = Order.all
  end

  # def search
  #   search_string = params[:term].downcase
  #   @clients = Client.where("name ILIKE ? ", "%#{search_string}%").limit(5)
  #   puts @clients.inspect
  #   respond_to do |response|
  #     format.json #{ render :show, status: :created, location: @vehicle_detail }
  #   end
  # end

  def show
    search_string = params[:term].downcase
    @clients = Client.where("name ILIKE ? or email ILIKE ?", "%#{search_string}%", "%#{search_string}%").limit(5)
  end

  def old
    @inactive = Order.inactive?
  end

  # def renew
  #   @current_user = current_user
  #   @order = Order.find_by_id(params[:id])
  #   Order.renew(params[:id])
  #   redirect_to :root
  #   flash[:notice] = "Renewed for 7 days from now. Enjoy!"

  #   begin
  #     OrderMailer.delay.renew_order(@order, @current_user).deliver
  #   rescue Exception => e
  #   end
  # end

  # def disable
  #   borrowed_qty = Order.find_by_id(params[:id]).quantity.to_i
  #   @borrowed_item = Order.find_by_id(params[:id]).item
  #   @borrowed_item.increment!(:remaining_quantity, borrowed_qty)
  #   @current_user = current_user
  #   @order = Order.find_by_id(params[:id])
  #   Order.disable(params[:id])
  #   redirect_to :root
  #   flash[:notice] = "Item marked as returned. Thank you!"

  #   begin
  #     OrderMailer.delay.return_order(@order, @current_user).deliver
  #   rescue Exception => e
  #   end
  # end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_url, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order was successfully updated.'}
        format.js { render nothing: true, status: :ok,  notice: 'Order was successfully updated.' }
      end
    else
      render :edit
    end
  end

  def destroy
    borrowed_qty = @order.quantity.to_i
    @borrowed_item = @order.item
    @borrowed_item.increment!(:remaining_quantity, borrowed_qty)
    @current_user = current_user
    @order.destroy

    redirect_to orders_url, notice: 'Order was successfully destroyed.'
    begin
      OrderMailer.delay.cancel_order(@order, @current_user).deliver
    rescue Exception => e
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def set_data
      @clients = Client.all
      @vehicle_details = VehicleDetail.all
    end

    def force_json
      request.format = :json
    end

    def order_params
      params.require(:order).permit(:id, :delivery_on, :client_id, :vehicle_detail_id, :delivered)
    end
end
