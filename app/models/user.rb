class User < ApplicationRecord
  has_many :reservations
  has_and_belongs_to_many :flights, through: :reservations, optional: true
  has_secure_password
end
