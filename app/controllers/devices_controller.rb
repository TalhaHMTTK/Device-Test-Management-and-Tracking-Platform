class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def new
    @device = Device.new(location_id: params[:location_id])
  end

  def create
    @device = Device.new(device_params)
    @location = @device.location
    respond_to do |format|
      if @device.save
        format.html
        format.turbo_stream { render locals: { :'@location' => @location }}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @device })}
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @device })}
      end
    end
  end

  def destroy
    @device.destroy
    redirect_to location_path(@device.location)
  end

  private

  def device_params
    params.require(:device).permit(:device_type, :manufacturer, :model, :max_flow, :max_pressure, :location_id, :company_id)
  end

  def set_device
    @device = Device.find(params[:id])
  end
end
