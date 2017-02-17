class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.attachment :image
      t.belongs_to :location, index: true
      t.timestamps
    end
  end
end
