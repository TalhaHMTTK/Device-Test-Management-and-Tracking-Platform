class Location < ApplicationRecord
  include Tenantable

  belongs_to :customer
  belongs_to :company
  has_many :devices

  validates :name, presence: true, length: { minimum: 3 }

  def self.ransackable_attributes(auth_object = nil)
    [ "id","customer_id", "company_id", "name" ]
  end
end
