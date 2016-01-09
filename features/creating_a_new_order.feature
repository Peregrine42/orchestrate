Feature: creating a new order

Scenario: a salesperson wants to take an order from a customer
  Given there is stock in the database
  And I visit /orders
  When I click the 'create' button
  And I fill out the details of the order
  And I click the 'add product' button
  And I select 'saxophone'
  And I click the 'add' button
  Then the 'saxophone' appears on the order
