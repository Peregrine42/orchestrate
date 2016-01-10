Given(/^there is a pending order in the database$/) do
  @order = Order.create!(first_name: "Duncan", status: "pending")
end

When(/^I visit the show page for that order$/) do
  visit "/orders/#{@order.id}"
end

When(/^set the '([\w ]+)' to '([\w ]+)'$/) do |box, item|
  select item, from: box
end

Then(/^the order status is confirmed$/) do
  expect(page.body).to have_content "confirmed"
end
