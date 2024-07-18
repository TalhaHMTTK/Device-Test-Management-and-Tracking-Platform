class Location < ApplicationRecord
  belongs_to :customer
  belongs_to :company
  has_many :devices
end
