class Api::TestsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user_with_jwt

  def index
    if @current_user
      @tests = @current_user.tests
      render json: @tests
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def last_month
    if @tests = @current_user.tests.where(
        'created_at BETWEEN ? AND ?', 
        DateTime.now - 30.days, 
        DateTime.now
      )
      render json: @tests
    else 
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def show
    if @test = @current_user.tests.where(params[:id])
      render json: @test
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def completed_tests
    if @test = @current_user.tests.where(status: 'completed')
      render json: @test
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def between_dates
    start_date = params[:start_date].to_datetime
    end_date = params[:end_date].to_datetime

    @tests = @current_user.tests.where(
      'created_at BETWEEN ? AND ?', 
      start_date, 
      end_date
    )
    
    render json: @tests
  rescue ArgumentError => e
    render json: { error: "Invalid date format. Please use ISO 8601 format (e.g., YYYY-MM-DDTHH:MM:SSZ)" }, status: :unprocessable_entity
  end

  private

  def authenticate_user_with_jwt
    token = request.headers['Authorization'].split(' ').last
    @current_user = User.find_by(jwt_token: token)
  end
end
