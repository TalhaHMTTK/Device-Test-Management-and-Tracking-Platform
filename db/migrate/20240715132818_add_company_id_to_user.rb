class AddCompanyIdToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :company
  end
end
