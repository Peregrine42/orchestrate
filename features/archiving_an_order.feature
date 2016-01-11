Feature: archiving an order

Scenario: an order is cancelled by the customer 
  Given there is a pending order for 'Joe Bloggs' in the database
  When I visit /orders
  And I click "archive" beside "Joe Bloggs's order"
  Then I no longer see 'Joe Bloggs' at /orders
  
Scenario: an accidentally cancelled order must be restored
  Given there is an archived order for 'Joe Bloggs' in the database
  When I visit /archived_orders
  And I click 'restore'
  Then I see "Joe Bloggs" at /orders