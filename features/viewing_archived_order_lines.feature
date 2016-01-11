Feature: restoring an archived order line

Scenario: a shop assistant makes a mistake, deleting the wrong order line
  Given there is a pending order in the database
  And the pending order has an archived line for a 'saxophone'
  When I visit the show page for that order
  And I click 'show archived'
  And I click 'restore'
  Then the 'saxophone' appears on the order