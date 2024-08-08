class User < ApplicationRecord
  include Tenantable

  belongs_to :company
  has_many :tests

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { tester: 0, admin: 1 }

  accepts_nested_attributes_for :company
  
  def self.ransackable_attributes(auth_object = nil)
    ["company_id", "email", "role", "id"]
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
