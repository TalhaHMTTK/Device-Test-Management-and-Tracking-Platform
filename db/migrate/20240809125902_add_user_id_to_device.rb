class AddUserIdToDevice < ActiveRecord::Migration[7.1]
  def change
    add_reference :devices, :user
  end
end
