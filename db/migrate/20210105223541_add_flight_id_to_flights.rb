class AddFlightIdToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :flight_id, :integer
  end
end
