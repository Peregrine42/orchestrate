Given(/^the pending order has a line for a '([\w ]+)'$/) do |product_name|
  product = Product.create!(name: product_name, description: "foo", price: 1)
  stock = Stock.create!(product: product, amount: 1)
  Line.create!(product: product, order: @order, quantity: 1)
end

When(/^I click "([\w ]+)" beside "([\w ']+)"$/) do |target, product|
  click_on target + " " + product
end

Then(/^the '([\w ]+)' no longer appears on the pending order$/) do |product|
  expect(page.body).to have_content(@order.first_name)
  expect(page.body).to_not have_content("saxophone")
end
