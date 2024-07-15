class Users::RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    resource.build_company
    respond_with self.resource
  end

  def create
    super do |resource|
      resource.company = Company.find_or_create_by(company_params)
      resource.save
    end
  end

  private

  def company_params
    params.require(:user).require(:company).permit(:name, :contact)
  end
end
