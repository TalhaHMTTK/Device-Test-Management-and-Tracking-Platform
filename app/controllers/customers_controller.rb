class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      respond_to do |format|
        format.html { redirect_to @customer }
        format.turbo_stream
      end
    end
  end

  def show
    @locations = @customer.locations
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      respond_to do |format|
        format.html { redirect_to @customer }
        format.turbo_stream
      end
    end
  end

  def index
    @customers = Customer.all
  end

  def destroy
    @customer.destroy
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
