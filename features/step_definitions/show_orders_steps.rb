Given /there are pending orders in the database/ do
  @orders = ["Joe", "Duncan", "Nicolas"].each do |first_name|
    Order.create!(
      first_name: first_name,
      address_line_1: "somewhere",
      postcode: "co111sf",
      status: "pending"
    )
  end
end

When /I visit (\/\w+)/ do |address|
  visit address
end

Then /I see the orders/ do
  @orders.each do |name|
    expect(page.body).to have_content(name)
  end
end
