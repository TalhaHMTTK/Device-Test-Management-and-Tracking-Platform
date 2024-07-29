class Location < ApplicationRecord
  belongs_to :customer
  belongs_to :company
  has_many :devices

  validates :name, presence: true, length: { minimum: 3 }
end
