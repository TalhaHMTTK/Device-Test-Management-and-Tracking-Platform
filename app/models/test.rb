class Test < ApplicationRecord
  belongs_to :device
  belongs_to :company
  belongs_to :user

  enum :status, { scheduled: 0, in_progress: 1, completed: 2 }
  enum :result, { pass: 0, fail: 1 }
end
