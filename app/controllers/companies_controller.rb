class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def show
    @company = Company.find(params[:id])
  end
end
