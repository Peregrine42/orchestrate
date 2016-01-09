class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.timestamps
      t.integer :quantity
      t.belongs_to :product
      t.belongs_to :order
    end
  end
end
