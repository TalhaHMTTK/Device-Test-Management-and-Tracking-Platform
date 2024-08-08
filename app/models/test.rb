class Test < ApplicationRecord
  include Tenantable

  belongs_to :device
  belongs_to :company
  belongs_to :user

  enum :test_type, { churn: 0, acceptance: 1, annual: 2 }
  enum :status, { scheduled: 0, in_progress: 1, completed: 2 }
  enum :result, { pass: 0, fail: 1 }

  def self.ransackable_attributes(auth_object = nil)
    ["company_id", "device_id", "id", "result", "status", "test_type", "user_id"]
  end

  def information
    "#{test_type.capitalize} test on #{device.device_type} (model: #{device.model}) by #{user.first_name}"
  end
end
