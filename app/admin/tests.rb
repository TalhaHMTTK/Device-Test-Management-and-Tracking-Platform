ActiveAdmin.register Test do

  actions :all, :except => [:new]
  
  permit_params :status, :result, :user_id, :test_type, :flow_rate, :pressure
  filter :status
  filter :result
  filter :device_id
  filter :company_id
  filter :user_id
  filter :test_type
  filter :id

  form do |f|
    f.inputs 'Test Details' do
      f.input :status, as: :select, collection: Test.statuses.keys
      f.input :result, as: :select, collection: Test.results.keys 
      f.input :test_type, as: :select, collection: Test.test_types.keys
      f.input :flow_rate
      f.input :pressure
    end
    f.actions
  end
end
