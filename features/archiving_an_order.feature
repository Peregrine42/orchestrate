Feature: archiving an order

Scenario: an order is cancelled by the customer 
  Given there is a pending order for 'Duncan Fermor' in the database
  When I visit /orders
  And I click "archive" beside "Duncan Fermor's order"
  Then I no longer see 'Duncan Fermor' at /orders
  
Scenario: an accidentally cancelled order must be restored
  Given there is an archived order for 'Duncan Fermor' in the database
  When I visit /archived_orders
  And I click "restore" beside "Duncan Fermor's order"
  Then I see "Duncan Fermor" at /orders