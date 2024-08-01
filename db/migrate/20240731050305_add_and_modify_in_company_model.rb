class AddAndModifyInCompanyModel < ActiveRecord::Migration[7.1]
  def change
    rename_column :companies, :contact, :phone
    add_column :companies, :address, :string
  end
end
