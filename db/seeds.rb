require "database_cleaner"
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean!

Order.create(
  first_name: "Ford",
  last_name: "Prefect",
  address_line_1: "somewhere",
  address_line_2: "far away",
  postcode: "XX4 1SD",
  status: "pending"
)

Order.create(
  first_name: "Arthur",
  last_name: "Dent",
  address_line_1: "somewhere",
  address_line_2: "far away",
  postcode: "XX4 1SD",
  status: "confirmed"
)

Order.create(
  first_name: "Zaphod",
  last_name: "Beeblebrox",
  address_line_1: "somewhere",
  address_line_2: "far away",
  postcode: "XX4 1SD",
  status: "dispatched"
)

sax = Product.create(
  name: "saxophone",
  description: "an amazing saxophone!",
  price: "599.99"
)

guitar = Product.create(
  name: "electric guitar",
  description: "an incredible electric guitar!",
  price: "59.99"
)

Stock.create(
  amount: 52,
  product: sax
)

Stock.create(
  amount: 21,
  product: guitar
)
