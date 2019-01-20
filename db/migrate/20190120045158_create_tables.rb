class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :min_guest
      t.integer :max_guest
      t.boolean :is_free, default: true
      t.time :booked_at
      t.references :restaurant, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end