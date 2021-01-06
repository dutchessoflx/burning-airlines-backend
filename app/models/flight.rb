class Flight < ApplicationRecord
  belongs_to :airplane, optional: true
  has_many :reservations
  has_and_belongs_to_many :users, through: :reservations, optional: true

  attribute :airplane_name, :string

  def generate_seat_map
    rows = self.airplane.rows
    cols = self.airplane.cols

    startRow = 21
    columnLabels = ['A','B','C','D','E','F','G','H','J','K','L','M']
    result = []

    rows.times do |row|
      row_data = {}
      row_data[startRow] = []

      cols.times do |col|
        id = row.to_s + '-' + col.to_s
        columnLabel = columnLabels[col]
        status = 'open'
        status = 'closed' if self.seat_is_reserved? id

        row_data[startRow] << {id: id, col: columnLabel, status: status}
      end

      result << row_data
      startRow = startRow + 1
    end

    result
  end

  def seat_is_reserved? id
    reserved = false

    self.reservations.each do |reservation|
      seat_id = reservation.row.to_s + '-' + reservation.cols.to_s
      reserved = true if seat_id == id
    end

    reserved
  end

end
