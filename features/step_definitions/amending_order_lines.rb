Given(/^the pending order has a line for a '([\w ]+)'$/) do |product_name|
  product = Product.create!(name: product_name)
  Line.create!(product: product, order: @order)
end

When(/^I click '([\w ]+)' beside '([\w ]+)'$/) do |target, product|
  click_on target + " " + product
end

Then(/^the '([\w ]+)' no longer appears on the pending order$/) do |product|
  expect(page.body).to_not have_content("saxophone")
end
