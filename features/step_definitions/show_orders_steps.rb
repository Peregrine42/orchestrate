Given /there are pending orders in the database/ do
  @orders = ["Joe", "Duncan", "Nicolas"].each do |name|
    Order.create(
      name: name, address: "somewhere", postcode: "co111sf", status: "pending"
    )
  end
end

When /I visit (\/\w+)/ do |address|
  visit address
end

Then /I see the unfulfilled orders/ do
  @orders.each do |name|
    expect(page.body).to have_content(name)
  end
end
