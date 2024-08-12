ActiveAdmin.register Device do
  
  actions :all, :except => [:new]

  permit_params :manufacturer, :model, :device_type, :max_flow, :max_pressure
  filter :company_id
  filter :location_id
  filter :user_id
  filter :device_type
  filter :manufacturer
  filter :model
  filter :id

  form do |f|
    f.inputs 'Device Details' do
      f.input :manufacturer
      f.input :model, as: :select, collection: Device.models.keys 
      f.input :device_type, as: :select, collection: Device.device_types.keys
      f.input :max_flow
      f.input :max_pressure
    end
    f.actions
  end
end
