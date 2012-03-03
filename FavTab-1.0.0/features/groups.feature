Feature: To check the groups functionality
    as an user
    I want various following scenarios.

   @javascript
   Scenario: See Manage groups links in left panel
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the my account page
    Then I should see "Manage Groups"

   @javascript
   Scenario: See manage group page
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the my account page
    Then I should see "Manage Groups"
    When I follow "Manage Groups"
    Then I should be on the manage groups page
    And I should see "Create Group"

   @javascript
   Scenario: See create group functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the manage groups page
    And I should see "Create Group"
    When I follow "Create Group"
    And I should see "Name:"
    And I should see "Create"

   @javascript
   Scenario: See create group validation functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the manage groups page
    And I should see "Create Group"
    When I follow "Create Group"
    And I should see "Name:"
    And I should see "Create"
    When I fill in the following:
     | group_name |  |
    And I press "Create"
    Then I should see "Name can't be blank."
    When I fill in the following:
     | group_name |        |
    And I press "Create"
    Then I should see "Name can't be blank."
    When I fill in the following:
     | group_name | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
    And I press "Create"
    Then I should see "Name can't be of more than 50 characters."
    When I fill in the following:
     | group_name | Friends |
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Group created successfully."
    And I should see "Friends" within "[@class='group_name']"

   @javascript
   Scenario: See group ui functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And "Satish" is following me
    And I go to the manage groups page
    When I follow "Create Group"
    And I fill in the following:
     | group_name | Default |
    And I press "Create"
    And I wait 1 seconds
    And I follow "View All"
    And I follow "share_with_group_link"
    And I check "grp_check_box_1"
    And I press "Add"
    And I go to the manage groups page
    And I wait 1 seconds
     When I follow "remove_user"
    And I accept confirm popup
    And I wait 3 seconds
    Then I should see "The user must belongs to atleast one group."
    When I follow "Create Group"
    And I fill in the following:
     | group_name | Family |
    And I press "Create"
    And I wait 1 seconds
    Then I should see "Family"
    And I should see "Rename"
    And I should see "Delete"
    And I follow "share_with_group_link"
    And I uncheck "grp_check_box_1"
    And I check "grp_check_box_2"
    And I press "Add"
    When I follow "remove_user"
    And I accept confirm popup
    And I wait 1 seconds
    When I follow "remove_user"
    And I accept confirm popup
    And I wait 1 seconds

   @javascript
   Scenario: See group edit functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And "Satish" is following me
    And I go to the manage groups page
    When I follow "Create Group"
    And I fill in the following:
     | group_name | Family |
    And I press "Create"
     And I wait 3 seconds
    And I should see "Rename"
    When I follow "Rename"
    And I should see "Name:"
    When I fill in the following:
     | group_name_edit |  |
    And I press "Update"
    Then I should see "Name can't be blank."
    When I fill in the following:
     | group_name_edit |        |
    And I press "Update"
    Then I should see "Name can't be blank."
    When I fill in the following:
     | group_name_edit | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
    And I press "Update"
    Then I should see "Name can't be of more than 50 characters."
    When I fill in the following:
     | group_name_edit | Friends |
    And I press "Update"
    And I wait 1 seconds
    Then I should see "Group name updated successfully."
    And I should see "Friends" within "[@class='group_name']"

   @javascript
   Scenario: See group delete functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have group named "My group"
    And "Satish" is following me
    And I go to the manage groups page
    Then I should see "My group"
    And I should see "Rename"
    And I should see "Delete"
    When I follow "Delete"
    And I accept confirm popup
    Then I should not see "My group"
