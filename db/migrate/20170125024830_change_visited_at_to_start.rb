class ChangeVisitedAtToStart < ActiveRecord::Migration[5.0]
  def change
    rename_column :locations, :visited_at, :start_date
    add_column :locations, :end_date, :datetime
  end
end
