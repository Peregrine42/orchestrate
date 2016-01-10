class AddArchivedFieldToLines < ActiveRecord::Migration
  def change
    add_column :lines, :archived, :boolean
  end
end
