class RemoveUserRefferenceFromCustomer < ActiveRecord::Migration[7.1]
  def change
    remove_reference :customers, :user
  end
end
