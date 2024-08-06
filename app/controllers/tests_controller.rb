class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def new
    @test = Test.new(device_id: params[:device_id])
  end

  def create
    @test = Test.new(test_params)
    @device = @test.device
    respond_to do |format|
      if @test.save
        flash[:notice] = 'Test was created successfully'
        format.html
        format.turbo_stream { render locals: { :'@device' => @device }}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @test }), status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @test.update(test_params)
        flash[:notice] = 'Test was updated successfully'
        format.html
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("all_errors", partial: "shared/errors", locals: { object: @test }), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @test.destroy
      flash[:notice] = 'Test was deleted successfully'
    else
      flash[:notice] = 'Test was not deleted'
    end
    redirect_to device_path(@test.device)
  end

  private

  def test_params
    params.require(:test).permit(:test_type, :flow_rate, :pressure, :status, :result, :device_id, :company_id, :user_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
