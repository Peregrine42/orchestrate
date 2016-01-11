Given(/^the pending order has an archived line for a '([\w ]+)'$/) do |p|
  product = Product.create!(name: p)
  Line.create!(product: product, order: @order, archived: true, quantity: 1)
end