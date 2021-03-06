Given(/^the pending order has an archived line for a '([\w ]+)'$/) do |p|
  product = Product.create!(name: p, description: "foo", price: 1)
  stock = Stock.create!(product: product, amount: 1)
  Line.create!(
    product: product, order: @order, archived: true, quantity: 1
  )
end
