#Author: chithra.ramachandran@ticgroup.com.au
Feature: Case creation for JB regular products
@jb-regular
  Scenario: lodge an abuse case for a regular product in doa period and
    check for a repair outcome with vendor liability
    
    Given I am at the solvup login page
    When I login as "JB0002"
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | Yes         |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          200 		 |
    | Date of Purchase               |		15-03-2019     |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | No			           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer	|
      | Abused                               | Yes                         					  |
      | Marked                               | Yes                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
    
    When I logout
    When I login as "service@alantin.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Ready for dispatch from repairer"
    When I fill the item ready for dispatch form
    Then the status should be "Sending to store from repairer"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Sending to store from repairer"
    When I fill the Item received in store form
    Then the status should be "Received in store to be rated"
    When the store rates the repair
    And I click on "Received Signature"
    Then the status should be "Complete"
    And I logout
  
  @jb-regular  
  Scenario: lodge a case for a regular product in doa period 
    			and check the status to be automatic replacement/refund on case completion

    Given I am at the solvup login page
    When I login as "JB0002"
   And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "562735477"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          555 		 |
    | Date of Purchase               |			 06-07-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I select Refund
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, automatic replacement (refunded)|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | Yes                         					  |
 And I logout
 
   @jb-regular       
  Scenario: lodge a case for a regular product in doa period, with no receipt
    and check the status to be repair with vendor liability

    Given I am at the solvup login page
    When I login as "JB0002"
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354333"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          200 		 |
    | Date of Purchase               |			 06-08-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      
    When I logout
    When I login as "service@alantin.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Ready for dispatch from repairer"
    When I fill the item ready for dispatch form
    Then the status should be "Sending to store from repairer"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Sending to store from repairer"
    When I fill the Item received in store form
    Then the status should be "Received in store to be rated"
    When the store rates the repair
    And I click on "Received Signature"
    Then the status should be "Complete"
    And I logout
    
  @jb-regular       
  Scenario: Create the case for a regular product in DOA with no receipt
  					and do a manager override to replace
  					
    Given I am at the solvup login page
    When I login as "JB0002"
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          600 		 |
    | Date of Purchase               |			 06-08-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I do a manager override to replace
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, refunded             				  |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
    And I logout
  
    
  @jb-regular        
  Scenario: lodge a case for a regular floor stock item
    and check for repair flow with Vendor liability

    Given I am at the solvup login page
    When I login as "JB0002"
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | Yes       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Store Contacted Vendor         | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Store Details"
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | Yes                         					  |
      | Within Automatic Replacement Period  | No                         					  |
    
    When I logout
    When I login as "service@alantin.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Ready for dispatch from repairer"
    When I fill the item ready for dispatch form
    Then the status should be "Sending to store from repairer"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Sending to store from repairer"
    When I fill the Item received in store form
    Then the status should be "Received in store to be rated"
    When the store rates the repair
    And I click on "Received Signature"
    Then the status should be "Complete"
    And I logout
      
    Scenario: lodge an abuse case for a floor stock item and
    check that the outcome is repair

    When I start a new case
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | Yes       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | Yes          |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Store Contacted Vendor         | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Store Details"
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | Yes                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
    When I logout
    When I login as "service_tgg@whirlpool.com"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Ready for dispatch from repairer"
    When I fill the item ready for dispatch form
    Then the status should be "Sending to store from repairer"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Sending to store from repairer"
    When I fill the Item received in store form
    Then the status should be "Received in store to be rated"
    When the store rates the repair
    And I click on "Received Signature"
    Then the status should be "Complete"

  Scenario: lodge a case for a regular product in warranty
    and check the status to be repair with vendor liability on case completion

    When I start a new case
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes 		           |
    | Receipt/Tax invoice Number     |     54236566      |
    | Purchase Price                 |          1000 		 |
    | Date of Purchase               |			 01-01-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
    When I logout
    When I login as "service_tgg@whirlpool.com"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Ready for dispatch from repairer"
    When I fill the item ready for dispatch form
    Then the status should be "Sending to store from repairer"
    When I logout
    When I login as "JB0000"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Sending to store from repairer"
    When I fill the Item received in store form
    Then the status should be "Received in store to be rated"
    When the store rates the repair
    And I click on "Received Signature"
    Then the status should be "Complete"

 Scenario: lodge a case for a regular product in warranty - with no receipt
    and check the status to be repair with vendor liability on case completion

    When I start a new case
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          1000 		 |
    | Date of Purchase               |			 01-01-2018  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
       Scenario: lodge an abuse case for a regular product in warranty 
    and check the status to be repair with vendor liability on case completion

    When I start a new case
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | Yes          |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes 		           |
    | Receipt/Tax invoice Number     |     54236566      |
    | Purchase Price                 |          1000 		 |
    | Date of Purchase               |			 01-01-2018  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | Yes                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
  Scenario: lodge a case for a regular product in warranty period
    and do a manager override to change the outcome from repair to replace

    When I start a new case
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "56273541212"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 12-09-2017  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I do a manager override to replace
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
       
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, automatic replacement					|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |

    
  Scenario: lodge a case for a regular product out of warranty and check for repair flow
     with consumer liability

    When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes 		           |
    | Receipt/Tax invoice Number     |     54236566      |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 12-09-2015  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
      Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    And I click Continue for Customer Communication Required
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
       
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Consumer	                      				|
      | Case Status                          | In store awaiting dispatch to repairer	|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
    
    When I logout
    When I login as "service_tgg@whirlpool.com"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Ready for dispatch from repairer"
    When I fill the item ready for dispatch form
    Then the status should be "Sending to store from repairer"
    When I logout
    When I login as "JB0000"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Sending to store from repairer"
    When I fill the Item received in store form
    Then the status should be "Received in store to be rated"
    When the store rates the repair
    And I click on "Received Signature"
    Then the status should be "Complete"
 
  Scenario: lodge a case for a regular product out of warranty with no receipt 
  				and check for repair flow with consumer liability

    When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 12-09-2015  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
      Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    And I click Continue for Customer Communication Required
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
       
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Consumer	                      				|
      | Case Status                          | Closed, automatic replacement					|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
       
   Scenario: lodge a case for a regular product out of warranty with no receipt 
  				and check for repair flow with consumer liability

    When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | Yes         |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 12-09-2015  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    And I click Continue for Customer Communication Required
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
       
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Consumer	                      				|
      | Case Status                          | In store awaiting dispatch to repairer	|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
       
  Scenario: lodge a case for an inHome product in DOA and check
    the status to be repairer to contact customer

    When I start a new case
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes        			 |
    | Receipt/Tax invoice Number     | 524657						 |
    | Purchase Price                 |          200			 |
    | Date of Purchase               | 06-05-2019		  			 |
    | Customer Contact Manufacturer  | No         			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I answer the manufacturer assistance question
    And I click Next
    
    Then I should land on page "Product Info"
     And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Repairer to contact customer						|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
    When the store does an at home service close
    Then the status should be "Complete"

  Scenario: lodge a case for an inHome product in warranty period and check
    for normal repair flow with courier booking

    When I start a new case
   And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes        			 |
    | Receipt/Tax invoice Number     | 524657						 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               | 01-12-2018  			 |
    | Customer Contact Manufacturer  | No         			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I answer the manufacturer assistance question
    And I click Next
    
    Then I should land on page "Product Info"
     And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Repairer to contact customer						|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
    
    When I logout
    When I login as "SMglen.cavenagh@jbhifi.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Resolved in-home"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Resolved in-home"
    When store reviews the at-home service
    And I click on "Received Signature"
    Then the status should be "Complete"
    
  Scenario: lodge a case for an inHome product within JB voluntary warranty period and check
    for repair flow with Vendor liability

   When I start a new case
   And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes        			 |
    | Receipt/Tax invoice Number     | 524657						 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               | 01-01-2017  			 |
    | Customer Contact Manufacturer  | No         			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I answer the manufacturer assistance question
    And I click Next
    
    Then I should land on page "Product Info"
     And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Repairer to contact customer						|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
    When I logout
    When I login as "SMglen.cavenagh@jbhifi.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Resolved in-home"
    When I logout
    When I login as "JB0000"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Resolved in-home"
    When store reviews the at-home service
    And I click on "Received Signature"
    Then the status should be "Complete"
    
  Scenario: lodge a case for an inHome product out of warranty and check
    for repair flow with Consumer liability

    When I start a new case
  And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes        			 |
    | Receipt/Tax invoice Number     | 524657						 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               | 01-01-2015  			 |
    | Customer Contact Manufacturer  | No         			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    Then I should land on page "Product Info"
     And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I close the customer comm popup
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Consumer	                      				|
      | Case Status                          | Repairer to contact customer						|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
   When I logout
    When I login as "SMglen.cavenagh@jbhifi.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Resolved in-home"
    When I logout
    When I login as "JB0000"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Resolved in-home"
    When store reviews the at-home service
    And I click on "Received Signature"
    Then the status should be "Complete"
 
   
  Scenario: lodge a case for an inHome product in DOA , without receipt
    and check for repair flow with Vendor liability

    When I start a new case
       And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No         			 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               |    06-05-2019   			 |
    | Customer Contact Manufacturer  | No         			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I answer the manufacturer assistance question
    And I click Next
    
    Then I should land on page "Product Info"
     And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Repairer to contact customer						|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |

  
  Scenario: lodge a case for an inHome product in DOA and override the outcome to replace the item in store

    When I start a new case
        And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No         			 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               |    06-05-2019   			 |
    | Customer Contact Manufacturer  | No         			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I answer the manufacturer assistance question
    And I do a manager override to refund
    
    Then I should land on page "Product Info"
     And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Item not Present												|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
 
 Scenario: lodge a case for an OOW inHome product with extended care and 
 check for extended care outcome (Closed, external handling)

     When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At home|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No         			 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               |    01-01-2015		 |
    | Customer Contact Manufacturer  | No          			 |
    | Extended Care Replace				   |               4	 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, external handling							|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
         
      
    Scenario: lodge a case for an OOW product and mark as Extended Care Replace.
    					It should be recorded as Extended Care
      When I start a new case 
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes 		           |
    | Receipt/Tax invoice Number     |     54236566      |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 01-09-2015  |
    | Extended Care Replace					 |  		2			       |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor		                      				|
      | Case Status                          | Closed, external handling							|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | No                 	      					  |
      
      Scenario: lodge a case for an OOW product and mark as Extended Care Repair.
    					It should be recorded as Extended Care and Closed, External Handling
     When I start a new case 
    And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes 		           |
    | Receipt/Tax invoice Number     |     54236566      |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 01-09-2015  |
    | Extended Care Repair					 |  		2			       |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor		                      				|
      | Case Status                          | Closed, external handling							|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | No                 	      					  |
      
     Scenario: lodge a case for an InWarranty product and mark as Extended Care Replace.
    					It should be recorded as a repair case with vendor liability
      When I start a new case 
      And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes 		           |
    | Receipt/Tax invoice Number     |     54236566      |
    | Purchase Price                 |          1000 		 |
    | Date of Purchase               |			 01-12-2017  |
    | Extended care replace				   | 						2			 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
        
   When I logout
    When I login as "service@alantin.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When I enter rectification report
    Then the status should be "Resolved in-home"
    When I logout
    When I login as "JB0000"
    When I click on List Cases
    And I click At Store tab
    When I View the case
    Then the status should be "Resolved in-home"
    When store reviews the at-home service
    And I click on "Received Signature"
    Then the status should be "Complete"
    
    Scenario: lodge a case for an OOW product and enter a longer manufacturer warranty
    and check for repair flow with Vendor liability

    When I start a new case
       And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked  											 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No         			 |
    | Purchase Price                 |          1000		 |
    | Date of Purchase               |    01-01-2016		 |
    | Customer Contact Manufacturer  | No          			 |
    | Longer warranty     				   |             1095	 |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
     Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"

    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer	|
      | Abused                               | Unknown                     					  |
      | Marked                               | Unknown                     					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
      Scenario: Create the case for a floorstock-soldbefore product in DOA
  					and check for an automatic replacement outcome
  					
     When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | FloorstockSoldBefore  | Yes       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          600 		 |
    | Date of Purchase               |			 06-05-2019       |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, automatic replacement				  |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
 
 @FloorstockRepair     
      Scenario: Create the case for a floorstock-soldbefore product in warranty
  					and check for a repair outcome
  					
     Given I am at the solvup login page
     When I login as "JB0002"
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | FloorstockSoldBefore  | Yes       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627113"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          600 		 |
    | Date of Purchase               |			 01-01-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Store Details"
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    When I select the first repairer
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | Yes                        					  |
      | Within Automatic Replacement Period  | No                         					  |

    When I logout				
  
  
     Scenario: Create the case for an abused floorstock-soldbefore product in warranty
  					and check for a repair outcome
     Given I am at the solvup login page
     When I login as "JB0002"
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | FloorstockSoldBefore  | Yes       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "56273541"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | Yes         |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          600 		 |
    | Date of Purchase               |			 01-01-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Store Details"
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    When I select the first repairer
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | In store awaiting dispatch to repairer |
      | Abused                               | Yes                         					  |
      | Marked                               | Yes                        					  |
      | Floorstock                           | Yes                        					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
    
@SAD-6152
     Scenario: Create the case for a Computer with price>1000 and check for manager authorisation on confirmation page.
     Proceed without manager credentials and check for validation error
  					
     When I start a new case 
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "63004" as search term
    And I select the first search result
    And I enter the serial number "5627354771"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    And I click Next
    When I click No to the troubleshooting question
    And I click Next
    When I click No to the troubleshooting question
    And I click Next
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          1111 		 |
    | Date of Purchase               |			 06-05-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I select Refund
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    | Item has Username/Password?    | No                |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    Then I should see manager override validation error
  
  @SAD-6152  
     Scenario: Create the case for a Computer with price>1000 and check for manager authorisation on confirmation page.
     Proceed with manager credentials and create an automatic replacement case
  					
     When I start a new case 
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "63004" as search term
    And I select the first search result
    And I enter the serial number "5627354771"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    And I click Next
    When I click No to the troubleshooting question
    And I click Next
    When I click No to the troubleshooting question
    And I click Next
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | Yes		           |
    | Receipt/Tax invoice Number     | 43236565 				 |
    | Purchase Price                 |          1111 		 |
    | Date of Purchase               |			 06-05-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I select Refund
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    | Item has Username/Password?    | No                |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I enter manager authorisation for over 1000 products
    And I click Next
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, automatic replacement (refunded)|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | Yes                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
     @SAD-6152  
     Scenario: Create a repair case for a Computer with price>1000 and do a manager override to replace.
     Proceed without manager credentials on confirmation page and create an automatic replacement case
  					
     When I start a new case 
       And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "63004" as search term
    And I select the first search result
    And I enter the serial number "5627354772"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked												 | No					 |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    And I click Next
    When I click No to the troubleshooting question
    And I click Next
    When I click No to the troubleshooting question
    And I click Next
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          1200 		 |
    | Date of Purchase               |			 06-05-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I do a manager override to replace
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    | Item has Username/Password?    | No                |
    And I click Next
    
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor 	                      				|
      | Case Status                          | Closed, automatic replacement				  |
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
    
    @SND-2
    Scenario: Pending credit cases closed as Credit Received option
    
     When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354126"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked                         | No          |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 12-01-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
       
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor	                      				|
      | Case Status                          | In store awaiting dispatch to repairer	|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
   When I logout
    When I login as "service@alantin.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Repairer tab
    When I View the case
    Then the status should be "Resolution accepted"
    When I fill the Item received in store form
    And I fill the customer collecting item form with pending credit outcome
    Then the status should be "pending credit"
    When I fill the pending credit form with Credit Received
    Then the status should be "Complete"
    
    @SND-7
    Scenario: Pending credit cases closed as Credit Received option
    
     When I start a new case
     And I enter the case type
      | Field       | Value    |
      | Staff ID       | 12345 |
      | Staff Password | pass  |
      |Product Location|At store|
      | Floorstock  | No       |
    And I click Next
    
    And I enter "17907" as search term
    And I select the first search result
    And I enter the serial number "5627354126"
    And I click Next
    
    Then I should land on page "Fault Report"
    And I fill Fault Report page with the following data
      | Field                          | Value        |
      | Fault Code										 | Power (A)    |
      | Fault Report   							   | Powers down at random|
      | Abuse           							 | No          |
      | Marked                         | No          |
      | Fault Replicated  						 | Yes				 |
    And I click Next
    
    Then I should land on page "Proof of Purchase"
    And I fill the Proof of Purchase page with the following data
    | Field													 | Value						 |
    | Receipt Sighted?               | No 		           |
    | Purchase Price                 |          2500 		 |
    | Date of Purchase               |			 12-01-2019  |
    And I click Next
    
    Then I should land on page "Case Summary"
    And I click Next
    
    
    Then I should land on page "Product Info"
    And I fill the Product Info page with the following data
    | Field													 | Value						 |
    | Repaired before 							 | No								 |
    | Customer Contacted Vendor      | No                |
    | Accessories			               | Yes		           |
    And I click Next
    
    Then I should land on page "Customer Details"
    And I fill Customer Details page with the following details
      | Field      | Value                                |
      | First Name | Chithra                              |
      | Last Name  | Ramachandran                         |
      | Email      | chithra.ramachandran@ticgroup.com.au |
      | Mobile     |                           0499151574 |
      | Address    | 214 Blackshaws Road                  |
      | Suburb     | ALTONA NORTH                         |
      | State      | Victoria                             |
    And I click Next
    
    Then I should land on page "Repairer Select"
    And I wait
    When I select the first repairer
    When I tick checkbox for customer acceptance
    And I click Next
       
    Then I should land on page "Confirmation"
    And I click Next
    
    Then I should land on page "Completion"
    
    When I View the case I should see the following details
      | Field																 | Value																	|
      | Liability of repair                  | Vendor	                      				|
      | Case Status                          | In store awaiting dispatch to repairer	|
      | Abused                               | No                         					  |
      | Marked                               | No                         					  |
      | Floorstock                           | No                         					  |
      | Within Automatic Replacement Period  | No                         					  |
      | Within manufacturers warranty period | Yes                 	      					  |
      
   When I logout
    When I login as "service@alantin.com.au"
    When I View the case
    And I click button "Item Received"
    Then the status should be "Received by repairer"
    When I enter visual inspection details for Vendor
    Then the status should be "Resolution accepted"
    When repairer logout
    When I login as "JB0002"
    When I click on List Cases
    And I click At Repairer tab
    When I View the case
    Then the status should be "Resolution accepted"
    When I fill the Item received in store form
    And I fill the customer collecting item form with pending credit outcome
    Then the status should be "pending credit"
    When I fill the pending credit form with Credit not required
    Then the status should be "Complete"
    
