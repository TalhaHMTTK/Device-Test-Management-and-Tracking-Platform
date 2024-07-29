class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :result, default: 0
      t.references :device
      t.references :company
      t.references :user
      
      t.timestamps
    end
  end
end
