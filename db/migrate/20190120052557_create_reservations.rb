class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :guest, foreign_key: true
      t.references :table, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.datetime :reservation_time
      t.datetime :reservation_end
      t.integer :guest_count

      t.timestamps
    end
  end
end
