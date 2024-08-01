class ModifiedTestField < ActiveRecord::Migration[7.1]
  def change
    remove_column :tests, :name if column_exists?(:tests, :name)
    add_column :tests, :test_type, :integer unless column_exists?(:tests, :test_type)
  end
end
