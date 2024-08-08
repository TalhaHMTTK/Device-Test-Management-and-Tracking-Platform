class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new(customer_id: params[:customer_id])
  end

  def create
    @location = Location.new(location_params)
    @customer = @location.customer
    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location created successfully.'
        format.html
        format.turbo_stream { render locals: { :'@customer' => @customer } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @location }), status: :unprocessable_entity}
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @location.update(location_params)
        flash[:notice] = 'Location updated successfully.'
        format.html
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @location }), status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @location.destroy
      flash[:notice] = 'Location deleted successfully.'
    else
      flash[:alert] = 'Location not deleted.'
    end
    redirect_to customer_path(@location.customer)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :contact_person, :customer_id, :company_id)
  end
end
