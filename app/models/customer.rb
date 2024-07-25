class Customer < ApplicationRecord
  include Tenantable
  
  belongs_to :company
  has_many :locations
end
