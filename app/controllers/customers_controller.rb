class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        flash[:notice] = 'Customer created successfully.'
        format.html { redirect_to @customer }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @customer }), status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        flash[:notice] = 'Customer updated successfully.'
        format.html { redirect_to @customer }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @customer }), status: :unprocessable_entity}
      end
    end
  end

  def index
    @customers = Customer.all
  end

  def destroy
    if @customer.destroy
      flash[:notice] = 'Customer deleted successfully.'
    else
      flash[:alert] = 'Customer not deleted'
    end
    redirect_to customers_path
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone, :address, :company_id)
  end
end
