class Test < ApplicationRecord
  include Tenantable

  belongs_to :device
  belongs_to :company
  belongs_to :user

  enum :test_type, { churn: 0, acceptance: 1, annual: 2 }
  enum :status, { scheduled: 0, in_progress: 1, completed: 2 }
  enum :result, { pass: 0, fail: 1 }
end
