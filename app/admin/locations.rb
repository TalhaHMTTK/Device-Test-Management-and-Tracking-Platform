ActiveAdmin.register Location do

  actions :all, :except => [:new]

  permit_params :name, :address, :contact_person
  filter :customer_id
  filter :company_id
  filter :id
  filter :name

  form do |f|
    f.inputs 'Location Details' do
      f.input :name
      f.input :address
      f.input :contact_person
    end
    f.actions
  end
end
