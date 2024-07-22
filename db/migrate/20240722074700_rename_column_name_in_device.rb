class RenameColumnNameInDevice < ActiveRecord::Migration[7.1]
  def change
    rename_column :devices, :company_name, :manufacturer
  end
end
