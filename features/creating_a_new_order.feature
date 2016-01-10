Feature: creating a new order

Scenario: a salesperson wants to take an order from a customer
  Given there is stock in the database
  And I visit /orders
  When I click 'create'
  And I fill out the details of the order
  And I click 'add product'
  And I select 'saxophone'
  And I click 'add'
  Then the 'saxophone' appears on the order
