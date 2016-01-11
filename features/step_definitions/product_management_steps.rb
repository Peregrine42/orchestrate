Given(/^there are several identical '([\w ]+)' products in the database$/) do |n|
  @product = Product.create! name: n, description: "an amazing saxophone"
  3.times do
    Stock.create! amount: 2, product: @product
  end
end

Then(/^there is one line representing all the '([\w ]+)' products$/) do |n|
  expect(page.body).to have_content n
end