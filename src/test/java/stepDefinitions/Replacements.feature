# Author: chithravr@gmail.com
# Scenario Description: Create return cases for all the retailers
# DOA , LPCO, manager overrides, premium service

Feature: Create a lite return case for JB

  @test
  Scenario: Create a lite return case for JB
  
    Given I am at the Solvup login page
    When I login as "JB0002"
    And I enter the case type
      | Field            | Value    |
      | Staff ID         |    12345 |
      | Product Location | At store |
    And I click Next
    And I enter "10586" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    Then I should land on page "Fault Report"
    And I logout

