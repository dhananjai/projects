Feature: Album in Process
   In order to test all Album functionality
   as an user
   I want various following scenarios.

   @javascript
   Scenario: See the Album link in left panel
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I go to the my account page
    Then I should see "Photo Albums"

   @javascript
   Scenario: See manage albums page
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the my account page
    Then I should see "Photo Albums"
    When I follow "Photo Albums"
    Then I go to the manage albums page
    And I wait 2 seconds
    And I should see "Add Album"
    

   @javascript
   Scenario: See create album functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the manage albums page
    And I should see "Add Album"
    And I wait 1 seconds
    When I follow "Add Album"
    And I wait 1 seconds
    And I should see "Name:"
    And I should see "Create"
    And I wait 1 seconds

   @javascript
   Scenario: See album validation functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the manage albums page
    And I should see "Add Album"
    When I follow "Add Album"
    And I should see "Name:"
    And I should see "Create"
    And I wait 1 seconds
    When I fill in the following:
     | album[name] |  |
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Name can't be blank."
    When I fill in the following:
     | album[name] | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Name can't be of more than 20 characters."
    And I wait 1 seconds
    When I fill in the following:
     | album[name] | My Photos |
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Album created successfully."
    And I should see "My Photos" 
    And I wait 2 seconds
    
   @javascript
   Scenario: See album delete functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I go to the manage albums page
    And I should see "Add Album"
    And I wait 1 seconds
    When I follow "Add Album"
    And I wait 1 seconds
    And I should see "Name:"
    And I should see "Create"
    And I wait 1 seconds
    When I fill in the following:
     | album[name] | My Albums |
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Album created successfully."
    And I go to the manage albums page
    And I should see "My Albums" 
    When I hover over "My Albums"
    And I wait 1 seconds
    And I should see "Rename"
    When I follow "remove_album_link"
    And I wait 1 seconds
    And I accept confirm popup

   @javascript
   Scenario: See album rename functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I go to the manage albums page
    When I hover over "My Albums"
    And I wait 1 seconds
    And I should see "Rename"
    When I follow "Rename"
    Then I should see "Name:"
    And I should see "Update" button
    And I wait 1 seconds
    When I fill in the following:
     | album[name] | My Albums |
    And I press "Update"
    And I wait 1 seconds
    Then I should see "Album name updated successfully."
    And I go to the manage albums page
    And I should see "My Albums"

   @javascript
   Scenario: See album share with group functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I have group named "My Friends"
    And I go to the manage albums page
    When I hover over "My Best Moment"
    When I follow "share_with_group_link"
    Then I should see "Share Album With Group"
    And I should see "Private"
    And I should see "Public"
    And I should see "Share With Groups"
    And I should see "Submit" button
    And I wait 1 seconds
    #Then I should see "Please select at least one group."
    #And I check "grp_check_box_1"
    #And I press "Add"
    #Then I should see "Album shared successfully."

   @javascript
   Scenario: See album private functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I have group named "My Friends"
    And I go to the manage albums page
    When I hover over "My Best Moment"
    When I follow "share_with_group_link"
    Then I should see "Share Album With Group"
    And I should see "Private"
    And I should see "Public"
    And I should see "Share With Groups"
    And I should see "Submit" button
    When I choose "private_choice"
    And I wait 1 seconds
    And I press "Submit"
    Then I should see "My Best Moment album is set to private."
    And I wait 1 seconds

   @javascript
   Scenario: See album public functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I have group named "My Friends"
    And I go to the manage albums page
    When I hover over "My Best Moment"
    When I follow "share_with_group_link"
    Then I should see "Share Album With Group"
    And I should see "Private"
    And I should see "Public"
    And I should see "Share With Groups"
    And I should see "Submit" button
    When I choose "public_choice"
    And I wait 1 seconds
    And I press "Submit"
    Then I should see "My Best Moment album is set to public."
    And I wait 1 seconds

   @javascript
   Scenario: See album share in Group functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I have group named "My Friends"
    And I go to the manage albums page
    When I hover over "My Best Moment"
    When I follow "share_with_group_link"
    Then I should see "Share Album With Group"
    And I should see "Private"
    And I should see "Public"
    And I should see "Share With Groups"
    And I should see "Submit" button
    When I choose "share_album_in_group"
    Then I check "grp_check_box_1"
    And I press "Submit"
    Then I should see "My Best Moment album shared successfully."
    And I wait 1 seconds

   @javascript
   Scenario: See Add photo and Back To Albums link
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    And I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I go to the manage albums page
    Then I should see "My Best Moment"
    When I follow "My Best Moment"
    Then I should see "Add Photo"
    And I should see "Back To Albums"
    And I wait 2 seconds

   @javascript
   Scenario: See Back To Albums functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    And I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I go to the manage albums page
    Then I should see "My Best Moment"
    When I follow "My Best Moment"
    Then I should see "Add Photo"
    And I should see "Back To Albums"
    And I wait 1 seconds
    When I follow "Back To Albums"
    And I go to the manage albums page
    And I wait 1 seconds

   @javascript
   Scenario: See Add photo functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    And I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I go to the manage albums page
    Then I should see "My Best Moment"
    When I follow "My Best Moment"
    Then I should see "Add Photo"
    And I should see "Back To Albums"
    And I wait 1 seconds
    When I follow "Add Photo"
    Then I should see "Add Photo"
    And I should see "Find Photo"
    And I should see "Upload Photo"
    And I wait 1 seconds
    When I follow "Find Photo"
    Then I should see "Add Photo"
    And I should see "Site Url:"
    And I should see "Find"
    And I wait 1 seconds

   @javascript
   Scenario: See Find photo functionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    And I press "Sign In"
    And I have album name "My Best Moment" and user_id 2 and share_type 0
    And I go to the manage albums page
    Then I should see "My Best Moment"
    When I follow "My Best Moment"
    Then I should see "Add Photo"
    And I should see "Back To Albums"
    And I wait 1 seconds
    When I follow "Add Photo"
    Then I should see "Add Photo"
    And I should see "Find Photo"
    And I should see "Upload Photo"
    And I wait 1 seconds
    When I follow "Find Photo"
    Then I should see "Add Photo"
    And I should see "Site Url:"
    And I should see "Find"
    And I wait 1 seconds
    When I fill in the following:
     | photos[site_url] | My Albums |
    And I press "Find"
    Then I should see "Please enter valid site url."
    And I wait 1 seconds
    When I fill in the following:
     | photos[site_url] |  |
    And I press "Find"
    Then I should see "Please enter site url."
    And I wait 1 seconds
    When I fill in the following:
     | photos[site_url] | http://www.wookmark.com/ |
    And I press "Find"
    And I wait 2 seconds
    Then I should see "Add Photo"
    And I should see div id "remote_photo_add"
    And I should see "Find"
    And I should see "Select an Album:"
    And I should see "Details:"
    And I should see div id "remote_add_photos_share_with_group"
    And I should see "Private"
    And I should see "Public"
    And I should see "Share With Groups"
    And I should see "Add" button
    When I fill in the following:
     | photo_detail | Nice place |
    When I choose "remote_private_share_photo"
    Then I press "Add"
    And I wait 2 seconds
    Then I should see "Nice place"
    And I wait 1 seconds
    When I hover over picture "Nice place"
    And I wait 1 seconds
    When I follow "remove_picture_link_from_album"
    And I wait 5 seconds
    And I accept confirm popup
    And I wait 1 seconds




