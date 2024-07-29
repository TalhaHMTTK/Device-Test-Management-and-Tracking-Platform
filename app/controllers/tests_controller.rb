class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to device_path(@test.device)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to device_path(@test.device)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to device_path(@test.device)
  end

  private

  def test_params
    params.require(:test).permit(:name, :status, :result, :device_id, :company_id, :user_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
