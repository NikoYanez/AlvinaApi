class User < ApplicationRecord
    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, presence: true, inclusion: { in: %w[owner clinic_admin], message: "%{value} is not a valid role" }
  
    # Enum for role
    enum role: { owner: 'owner', clinic_admin: 'clinic_admin' }
end