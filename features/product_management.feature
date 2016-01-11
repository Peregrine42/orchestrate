Feature: product management

Scenario: the store wants to take an inventory
  Given there are several identical 'saxophone' products in the database
  When I visit /stock
  Then there is one line representing all the 'saxophone' products