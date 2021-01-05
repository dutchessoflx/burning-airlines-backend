class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flight
  # ///asscoicate to plane through flight????
end
