class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  impersonates :user
  set_current_tenant_through_filter
  before_action :set_tenant, if: -> { current_user }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :address, :company_id, company_attributes: [:name, :phone, :address]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :address, :company_id])
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:role, :address, :company_id, :email]
  end

  private

  def set_tenant
    set_current_tenant(current_user.company)
  end
end
