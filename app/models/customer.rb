class Customer < ApplicationRecord
  include Tenantable

  belongs_to :company
  has_many :locations

  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true, length: { minimum: 4 }
  validates :address, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "company_id", "id", "name"]
  end
end
