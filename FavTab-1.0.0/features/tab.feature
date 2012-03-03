  Feature: Tab Manage in Process
    In order to test all Tab functionality 
    as an user
    I want various following scenarios.

   @javascript
   Scenario: See links in section
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the my account page 
    Then I should see " Add New Tab List"
    And I should see "My Tabs"

   @javascript
   Scenario: See Create tab funtionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the my account page 
    Then I should see "Add New Tab List"
    When I follow "Add New Tab List"
    Then I should see "Add Tab List"
    When I fill in the following:
     | tab_name |  |
    And I press "Add"
    Then I should see "Please enter tabname."
    When I fill in the following:
     | tab_name | hello11111111111111111111111111111111111111111111111111111111111111111111111sdddddddddddddddddddddddddddddddddddddddddddddd |
    And I press "Add"
    Then I should see "Tabname is too long."
    When I fill in the following:
     | tab_name | My First Tab |
    And I press "Add"
    Then I should be on the my account page
    And I wait 1 seconds
    And I should see "Tab created sucessfully."
    And I should see "My First Tab" within "[@class='tab_name']"

    

   @javascript
   Scenario: See new tab fuctionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have tab "My tab"
    And I have site "http://www.google.com"
    And I go to the my account page
    When I follow "expand_tab"
    Then I should see "Google"
    Then I should see "Edit"

   @javascript
   Scenario: See menus in tab
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have tab "My tab"
    And I go to the my account page
    When I follow "toggle_tab_option_link"
    Then I should see "Go To Tab"
    And I should see "Add Open Tabs"
    And I should see "Edit Name"
    And I should see "Add Site"

   @javascript
   Scenario: See Add Open Tabs functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have tab "My tab"
    And I have site "http://www.google.com"
    And I go to the my account page 
    And I follow "toggle_tab_option_link"
		And I wait 2 seconds
    Then I should see "Go To Tab"
    And I should see "Add Open Tabs"
    And I should see "Edit Name"
    And I should see "Add Site"
    When I follow "Add Open Tabs"
    Then I should see "current_tab"

   @javascript
   Scenario: See Add Site functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have tab "My tab"
    And I have site "http://www.google.com"
    And I go to the my account page 
    And I follow "toggle_tab_option_link"
		And I wait 2 seconds
    Then I should see "Go To Tab"
		And I should see "Add Open Tabs"
		And I should see "Edit Name"
		And I should see "Add Site"
    When I follow "Add Site"
    Then I should see "add_site"

   @javascript
   Scenario: See edit site functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have tab "My tab"
    And I have site "http://www.google.com"
    And I go to the my account page 
    And I follow "toggle_tab_option_link"

    Then I should see "Go To Tab"
		And I should see "Add Open Tabs"
		And I should see "Edit Name"
		And I should see "Add Site"
    When I follow "Edit Name"
    Then I should see "Edit Tab List"
    When I fill in the following:
     | tab_name |  |
    And I press "Update"
    Then I should see "Please enter tabname."
    When I fill in the following:
     | tab_name | hello11111111111111111111111111111111111111111111111111111111111111111111111sdddddddddddddddddddddddddddddddddddddddddddddd |
    And I press "Update"
    Then I should see "Tabname is too long."
    When I fill in the following:
     | tab_name | My Updated Tab |
    And I press "Update"
    Then I should be on the my account page
    And I wait 1 seconds
    And I should see "Tab updated sucessfully."
    And I should see "My Updated Tab" within "[@class='tab_name']"

    


