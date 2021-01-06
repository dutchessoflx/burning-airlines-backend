class Flight < ApplicationRecord
  belongs_to :airplane, optional: true
  has_many :reservations
  has_and_belongs_to_many :users, through: :reservations, optional: true

  def generate_seat_map
    rows = self.airplane.row
    cols = self.airplane.cols
    result = []

    rows.times do |row|
      row_data = {}
      cols.times do |col|
        
      end
    end

  end
end
