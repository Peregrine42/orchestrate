class SeperateAddressOnOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :address, :string
    add_column :orders, :address_line_1, :string
    add_column :orders, :address_line_2, :string
    add_column :orders, :address_line_3, :string
  end
end
