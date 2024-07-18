class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  before_action :set_company, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:role, :address, :company_id])
  end

  def set_company
    @company_id = current_user.company_id
  end
end
