class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.time :morning_shift_start
      t.time :morning_shift_end
      t.time :night_shift_start
      t.time :night_shift_end
      t.boolean :is_open
      t.boolean :free_tables
      t.text :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :banner_image_path

      t.timestamps
    end
  end
end
