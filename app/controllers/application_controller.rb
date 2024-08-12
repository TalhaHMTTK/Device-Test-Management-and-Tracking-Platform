class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  impersonates :user
  set_current_tenant_through_filter
  before_action :set_tenant, if: -> { current_user && !skip_tenant_for_controller? }, unless: :active_admin_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end

  def skip_tenant_for_controller?
    controller_name == 'home' # Check if the current controller is 'home'
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to view this page."
    redirect_to(request.referrer || root_path)
  end
end
