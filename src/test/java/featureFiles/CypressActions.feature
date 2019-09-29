# Author: chithravr@gmail.com
# Scenario Description: Test the basic functions of cypress.io
# Function names can be specified as datatable
# Functions implemented so far: type, submit, clear, check, select and click

Feature: Automate basic functions of https://example.cypress.io

  @test
  Scenario: Automate the basic functions of cypress.io
    Given I am at the example cypress site
    When I navigate to actions
    Then I should be able to perform the following functions:
      | type |
    And email field should have value "chithravr@gmail.com"
    Then the textarea should be disabled
