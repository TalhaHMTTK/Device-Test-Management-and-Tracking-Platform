class ModifyColumnInDevice < ActiveRecord::Migration[7.1]
  def change
    remove_column :devices, :name
    add_column :devices, :device_type, :integer
    add_column :devices, :max_flow, :float
    add_column :devices, :max_pressure, :float
  end
end
