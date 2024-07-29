class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.save
    redirect_to location_path(@device.location)
  end

  def show; end

  def edit; end

  def update
    @device.update(device_params)
    redirect_to location_path(@device.location)
  end

  def destroy
    @device.destroy
    redirect_to location_path(@device.location)
  end

  private

  def device_params
    params.require(:device).permit(:name, :manufacturer, :model, :location_id, :company_id)
  end

  def set_device
    @device = Device.find(params[:id])
  end
end
