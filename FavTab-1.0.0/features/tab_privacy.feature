  Feature: Tab sharing functionality
    In order to test all Tab sharing functionality
    as an user
    I want various following scenarios.

   @javascript
   Scenario: See Make public and Share with Group option in options link
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
    And I should see "Make Public"
    And I should see "Share With Group"

   @javascript
   Scenario: See Make private and share with group when Make public is clicked
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
    And I should see "Make Public"
    And I should see "Share With Group"
    When I follow "Make Public"
    And I go to the my account page
    And I follow "toggle_tab_option_link"
    And I wait 2 seconds
    Then I should see "Go To Tab"
    And I should see "Add Open Tabs"
    And I should see "Edit Name"
    And I should see "Add Site"
    And I should see "Make Private"
    And I should see "Share With Group"

   @javascript
   Scenario: See Make public and share with group when Make private is clicked
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
    And I should see "Make Public"
    And I should see "Share With Group"
    When I follow "Make Private"
    And I go to the my account page
    And I follow "toggle_tab_option_link"
    And I wait 2 seconds
    Then I should see "Go To Tab"
    And I should see "Add Open Tabs"
    And I should see "Edit Name"
    And I should see "Add Site"
    And I should see "Make Public"
    And I should see "Share With Group"

   @javascript
   Scenario: See popup when share with group is clicked
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I have tab "My tab"
    And I have site "http://www.google.com"
    And I go to the my account page
    And I have group named "My group"
    And I follow "toggle_tab_option_link"
    And I wait 2 seconds
    Then I should see "Go To Tab"
    And I should see "Add Open Tabs"
    And I should see "Edit Name"
    And I should see "Add Site"
    And I should see "Make Public"
    And I should see "Share With Group"
    When I follow "Share With Group"
    Then I should see "share_with_group_popup"
    And I should see "Share"
    When I press "Add"
    Then I should see "Please select at least one group."
    And I check "grp_check_box_1"
    And I press "Add"
    Then I should see "Tab shared successfully."
