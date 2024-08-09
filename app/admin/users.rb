ActiveAdmin.register User do

  actions :all, :except => [:new]

  permit_params :email, :role, :address, :first_name, :last_name, :updated_at
  filter :email
  filter :role
  filter :company_id
  filter :id

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :role, as: :select, collection: User.roles.keys
    end
    f.actions
  end
  

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :role
    column 'Actions' do |user|
      links = ''.html_safe
      links += link_to 'View', admin_user_path(user)
      links += ' | '
      links += link_to 'Edit', edit_admin_user_path(user)
      links += ' | '
      links += link_to 'Emulate', impersonate_user_path(user), method: :post
      links += ' | '
      links += link_to 'Delete', admin_user_path(user), method: :delete, data: { confirm: 'Are you sure?' }
      links
    end
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :role
      row :created_at
      row :updated_at
    end
  end  
end
