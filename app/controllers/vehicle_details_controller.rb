class VehicleDetailsController < ApplicationController
  before_action :set_vehicle_detail, only: [:show, :edit, :update, :destroy]
  before_action :get_items, only: [:new, :edit, :index]

  # GET /vehicle_details
  # GET /vehicle_details.json
  def index
    @vehicle_details = VehicleDetail.all
  end

  # GET /vehicle_details/1
  # GET /vehicle_details/1.json
  def show
  end

  # GET /vehicle_details/new
  def new
    @vehicle_detail = VehicleDetail.new
  end

  # GET /vehicle_details/1/edit
  def edit
  end

  # POST /vehicle_details
  # POST /vehicle_details.json
  def create
    @vehicle_detail = VehicleDetail.new(vehicle_detail_params)
    respond_to do |format|
      if @vehicle_detail.save
        format.html { redirect_to vehicle_details_url, notice: 'Vehicle detail was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_detail }
      else
        format.html { render :new }
        format.json { render json: @vehicle_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_details/1
  # PATCH/PUT /vehicle_details/1.json
  def update
    respond_to do |format|
      if @vehicle_detail.update(vehicle_detail_params)
        format.html { redirect_to vehicle_details_url, notice: 'Vehicle detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_detail }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_details/1
  # DELETE /vehicle_details/1.json
  def destroy
    @vehicle_detail.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_details_url, notice: 'Vehicle detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_detail
      @vehicle_detail = VehicleDetail.find(params[:id])
    end

    def get_items
      @items = Item.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_detail_params
      params.require(:vehicle_detail).permit(:id, :item_id, :engine_no,:chassis_no, :controller_no, :motor_no, :charger_no_1, :charger_no_2, :color_id, :make_of_battery, :battery_id)
    end
end
