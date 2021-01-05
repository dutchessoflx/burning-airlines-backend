class AddPlaneIdToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :plane_id, :integer
  end
end
