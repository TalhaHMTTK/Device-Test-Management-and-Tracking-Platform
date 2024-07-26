class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new(customer_id: params[:customer_id])
  end

  def create
    @location = Location.new(location_params)
    @customer = @location.customer
    if @location.save
      respond_to do |format|
        format.html
        format.turbo_stream { render locals: { :'@customer' => @customer } }
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @location.update(location_params)
      respond_to do |format|
        format.html
        format.turbo_stream
      end
    end
  end

  def destroy
    @location.destroy
    redirect_to customer_path(@location.customer)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :customer_id, :company_id)
  end
end
