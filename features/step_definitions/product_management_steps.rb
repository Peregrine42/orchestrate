Given(/^there are several identical '([\w ]+)' products in the database$/) do |n|
  @product = Product.create!(
    name: n, description: "an amazing saxophone", price: 1
  )
  3.times do
    Stock.create! amount: 2, product: @product
  end
end

Then(/^there is one line representing all the '([\w ]+)' products$/) do |n|
  expect(page.body).to have_content n
end

Given(/^there is a '([\w ]+)' product in the database$/) do |product_name|
  @product = Product.create!(
    name: product_name, description: 'foo bar', price: 1
  )
end

When(/^fill out the form with the new stock details$/) do
  fill_in "amount", with: 3
  select @product.name, from: "product"
end

Then(/^the '([\w ]+)' stock is shown in the table$/) do |name|
  expect(page.body).to have_content name
  expect(page.body).to have_content 3
end

When(/^I fill out the form with the new product details$/) do
  fill_in "name", with: "piano"
  fill_in "description", with: "a superlative piano!"
  fill_in "price", with: 2099.99
end

Then(/^the new product is shown in the stocks table$/) do
  expect(page.body).to have_content "piano"
end

Then(/^the amount is (\d+)$/) do |amount|
  expect(page.body).to have_content amount
end
