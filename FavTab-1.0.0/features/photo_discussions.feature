Feature: Photo Discussion in Process
  In order to test all photo discussion functionality
  as an user
  I want the various following scenarios.

   @javascript
   Scenario: See Photo Discussion link in section
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Photo Discussion"

   @javascript
   Scenario: See Photo Discussion UI
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Photo Discussion"
    When I follow "Photo Discussion"
    And I should see "Add Photo"
    
   @javascript
   Scenario: See Add Photo Functionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Photo Discussion"
    When I follow "Photo Discussion"
    And I should see "Add Photo"
    When I follow "Add Photo"
    Then I should see "Add_photo_popup"
    And I should see "Add_Photo_from_Url"
    And I should see "Upload_Photo_from_System"

   @javascript
   Scenario: See Add Photo From Url Functionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Photo Discussion"
    When I follow "Photo Discussion"
    And I should see "Add Photo"
    When I follow "Add Photo"
    Then I should see "Add_photo_popup"
    And I should see "Add_Photo_from_Url"
    When I follow "Add_Photo_from_Url"
    Then I should see "url_field"
    And I should see "List of all Photos"
    And I should see "Add button"
    When I follow "Add button"
    Then I should see "Posted Photo"
    Then I should see "Photowithpostcomment"
    Then I should see "Share_with_group"
    Then I should see "Delete"
    
   @javascript
   Scenario: See Add Photo From Browse Functionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Photo Discussion"
    When I follow "Photo Discussion"
    And I should see "Add Photo"
    When I follow "Add Photo"
    Then I should see "Add_photo_popup"
    And I should see "Upload_photo"
    When I follow "Upload_photo"
    Then I should see "browse_field"
    When I attach the file at "/home/satish/Desktop/flower030.gif" to "browse_field"
    And I should see "Add button"
    When I follow "Add button"
    Then I should see "Posted Photo"
    Then I should see "Photowithpostcomment"
    Then I should see "Share_with_group"
    Then I should see "Delete"


   @javascript
   Scenario

   @javascript
   Scenario: See Comments On Photo Functionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Photo Discussion"
    When I follow "Photo Discussion"
    And I should see "List of all Photos with comments"
    And I should see "Photowithpostcomment"
    And I should see "Post Comment button"
    When I fill in the following:
     | post_comment | This is very nice photo |
    Then I press "Post Comment button"
    And I should see "Posted Comments"



        
    


  
