class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.datetime :visited_at
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
