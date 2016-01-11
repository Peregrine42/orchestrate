Feature: product management

Scenario: the store wants to take an inventory
  Given there are several identical 'saxophone' products in the database
  When I visit /stocks
  Then there is one line representing all the 'saxophone' products
  
Scenario: the store wants to add stock to the inventory
  Given there is a 'saxophone' product in the database
  When I visit /stocks
  And I click 'add stock'
  And fill out the form with the new stock details
  And I click 'add stock'
  Then the 'saxophone' stock should be shown in the table