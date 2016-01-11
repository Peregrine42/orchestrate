Given(/^there is a pending order for '([\w ]+)' in the database$/) do |name|
  first_name, last_name = name.split(" ")
  @order = Order.create!(first_name: first_name, last_name: last_name)
end

Then(/^I no longer see '([\w ]+)' at \/orders$/) do |name|
  expect(page.body).to have_content "orders"
  expect(page.body).to_not have_content name
end