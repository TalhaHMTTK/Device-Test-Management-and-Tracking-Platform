class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  set_current_tenant_through_filter
  before_action :set_tenant, if: -> { current_user }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :address, :company_id, company_attributes: [:name, :contact]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :address, :company_id, company_attributes: [:name, :contact]])
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:role, :address, :company_id, :email]
  end

  private

  def set_tenant
    set_current_tenant(current_user.company)
  end
end
