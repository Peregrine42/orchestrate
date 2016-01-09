class CreateStock < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :location
      t.integer :amount
      t.belongs_to :product
      t.timestamps
    end
  end
end
