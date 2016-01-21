require "rails_helper"

describe Order do
  it (
    "has a status that cannot " + 
    "be moved from confirmed to pending") do
      order = Order.create!(
        first_name: "Joe",
        last_name: "Bloggs",
        address_line_1: "somewhere",
        postcode: "CO111SF"
      )
      order.status = "confirmed"
      order.save
      order.status = "pending"
      expect(order.save).to eq false
  end
end