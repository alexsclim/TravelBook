class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title, null: false, default: ""
      t.text :summary

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
