Given /^there is stock in the database$/ do
  @product = Product.create! name: "saxophone", description: "foo", price: 1
  @undesired_product = Product.create!(
    name: "bagpipes", description: "foo", price: 1
  )
  @target_stock = Stock.create! amount: 3, product: @product
  @other_stock =  Stock.create! amount: 4, product: @undesired_product
end

When /^I click '([\w \/]+)'$/ do |button_name|
  click_on button_name
end

When /^I fill out the details of the order$/ do
  fill_in "first name", with: "Duncan"
  fill_in "last name", with: "Fermor"
  fill_in "line 1", with: "somewhere"
  fill_in "postcode", with: "CO11 1SF"
  click_on "create order"
end

When(/^I select '([\w ]+)'$/) do |product|
  select product, from: "product"
  fill_in "quantity", with: 2
end

Then(/^the '([\w ]+)' appears on the order$/) do |product|
  expect(page.body).to have_content product
end
