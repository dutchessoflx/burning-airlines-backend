class AddFlightToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :flight, :integer
  end
end
