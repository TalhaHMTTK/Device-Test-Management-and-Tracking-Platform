class Customer < ApplicationRecord
  belongs_to :company
  has_many :locations

  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true, length: { minimum: 4 }
  validates :address, presence: true
end
