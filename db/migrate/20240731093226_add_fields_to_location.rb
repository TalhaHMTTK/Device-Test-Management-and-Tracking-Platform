class AddFieldsToLocation < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :address, :string
    add_column :locations, :contact_person, :text
  end
end
