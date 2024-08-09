class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  before_action :set_company, only: [:new, :create]
  before_action :authorize_invite, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

  def update
    super
    UserMailer.welcome_email(@user).deliver_now
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:role, :address, :company_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :role, :address, :company_id])
  end

  def set_company
    @company_id = current_user.company_id
  end

  def authorize_invite
    authorize User, :invite?
  end
end
