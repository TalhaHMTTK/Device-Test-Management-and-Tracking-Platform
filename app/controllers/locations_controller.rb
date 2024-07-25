class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to customer_path(@location.customer)
  end

  def show; end

  def edit; end

  def update
    @location.update(location_params)
    redirect_to customer_path(@location.customer)
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
