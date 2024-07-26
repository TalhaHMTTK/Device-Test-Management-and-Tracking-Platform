class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def new
    @device = Device.new(location_id: params[:location_id])
  end

  def create
    @device = Device.new(device_params)
    @location = @device.location
    if @device.save
      respond_to do |format|
        format.html
        format.turbo_stream { render locals: { :'@location' => @location }}
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @device.update(device_params)
      respond_to do |format|
        format.html
        format.turbo_stream
      end
    end
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
