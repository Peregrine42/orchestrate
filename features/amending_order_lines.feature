Feature: a customer has changed their mind, their pending order must be amended

Scenario: deleting an order line
  Given there is a pending order in the database
  And the pending order has a line for a 'saxophone'
  When I visit the show page for that order
  And I click 'archive' beside 'saxophone'
  Then the 'saxophone' no longer appears on the pending order
