class AddTripToLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :trips, index: true
  end
end
