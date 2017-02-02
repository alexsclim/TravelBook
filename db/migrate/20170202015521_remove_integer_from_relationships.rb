class RemoveIntegerFromRelationships < ActiveRecord::Migration[5.0]
  def change
    remove_column :relationships, :integer, :string
  end
end
