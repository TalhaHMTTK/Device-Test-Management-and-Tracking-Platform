class User < ApplicationRecord
  belongs_to :company
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { tester: 0, admin: 1 }
end
