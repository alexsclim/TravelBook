class ChangeDatetimeToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :start_date, :date
    change_column :locations, :end_date, :date
  end
end
