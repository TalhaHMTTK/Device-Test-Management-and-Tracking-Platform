class Test < ApplicationRecord
  belongs_to :device
  belongs_to :company
  belongs_to :user

  enum :status, { planned: 0, working: 1, completed: 2 }
end
