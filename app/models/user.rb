class User < ApplicationRecord
  include Tenantable

  belongs_to :company
  has_many :tests
  has_many :devices

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { tester: 0, admin: 1 }

  accepts_nested_attributes_for :company

  before_save :assign_jwt_token
  
  def self.ransackable_attributes(auth_object = nil)
    ["company_id", "email", "role", "id"]
  end

  def display_name
    "#{first_name} #{last_name}".titleize
  end

  def assign_jwt_token
    self.jwt_token = generate_jwt
  end

  def generate_jwt
    payload = { user_id: self.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
