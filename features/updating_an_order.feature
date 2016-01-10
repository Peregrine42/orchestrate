Feature: updating an order

Scenario: a member of staff wants to change the status of an order
  Given there is a pending order in the database
  When I visit the show page for that order
  And I click 'edit order'
  And set the 'status' to 'confirmed'
  And I click 'update'
  Then the order status is confirmed
