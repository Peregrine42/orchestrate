Feature: showing the list of orders

Scenario: the warehouse staff want to see the orders they must fulfil
  Given there are pending orders in the database
  When I visit /orders
  Then I see the unfulfilled orders
