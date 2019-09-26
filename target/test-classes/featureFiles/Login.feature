#Author: chithravr@gmail.com

@tag
Feature: Login to Solvup

@test
  Scenario: lodge an abuse case for a regular product in doa period and
    check for a repair outcome with vendor liability
    
    Given I am at the solvup login page
    When I login as "chithra.ramachandran@ticgroup.com.au"
