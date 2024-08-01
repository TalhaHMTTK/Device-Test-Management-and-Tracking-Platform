class AddFieldsToTest < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :flow_rate, :float
    add_column :tests, :pressure, :float
  end
end
