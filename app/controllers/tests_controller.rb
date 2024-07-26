class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def new
    @test = Test.new(device_id: params[:device_id])
  end

  def create
    @test = Test.new(test_params)
    @device = @test.device
    if @test.save
      respond_to do |format|
        format.html
        format.turbo_stream { render locals: { :'@device' => @device }}
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      respond_to do |format|
        format.html
        format.turbo_stream
      end
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
