class AddColsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :cols, :integer
  end
end
