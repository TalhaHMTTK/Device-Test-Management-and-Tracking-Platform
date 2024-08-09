ActiveAdmin.register Customer do

  actions :all, :except => [:new]

  permit_params :name, :phone, :address
  filter :address
  filter :company_id

  form do |f|
    f.inputs 'Customer Details' do
      f.input :name
      f.input :phone
      f.input :address
    end
    f.actions
  end
end
