#Author: chithravr@gmail.com

Feature: Automate basic functions of https://example.cypress.io

@test
  Scenario Outline: login to solvup as admin
    
    Given I am at the example cypress site
    When I click the action <Action>
    And I enter the email "chithravr@gmail.com"
    Then the textarea should be disabled
    Examples:
     | Action |
     | type   |
     | focus  |
     | blur   |
    
    
