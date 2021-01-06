class Flight < ApplicationRecord
  belongs_to :airplane, optional: true
  has_many :reservations
  has_and_belongs_to_many :users, through: :reservations, optional: true

  def generate_seat_map
    row = self.airplane.row
    cols = self.airplane.cols

    row.times do
      cols.times do
      end
    end
    
  end
end
