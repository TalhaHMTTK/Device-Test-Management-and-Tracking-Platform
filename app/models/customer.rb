class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :locations
end
