class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :status
      
      t.timestamps
    end
  end
end
