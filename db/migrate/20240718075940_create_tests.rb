class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :status, default: 0
      t.string :result, default: "Pending"
      t.references :device
      t.references :company

      t.timestamps
    end
  end
end
