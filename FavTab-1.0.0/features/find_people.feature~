  Feature: Find People in Process
    In order to test all Find People functionality 
    as an user
    I want various following scenarios.
  
   @javascript
   Scenario: See Find People link in section
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Find People"
		

   @javascript
   Scenario: See Find People UI
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Find People"
    When I follow "Find People"
    And I should see "Username"
    And I should see "Tab"
    And I should see "Work History"
    And I should see "Education"
    And I should see "Age"
#    And I should see "user_age_to"
    And I should see "Sex"
#    And I should see "user_sex_female"
    And I should see "Internet Interest"
    And I should see "About Me"
    And I should see "Search"
    

   @javascript
   Scenario: See Find People With Username fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username | name |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    Then I should see "Search Result"   
    And I should see "Search Result"
    And I wait 2 seconds
    
   @javascript
   Scenario: See Find People With Tab fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username |  |
    | user_tab | myfav |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    Then I should see "Search Result"    
    And I should see "Search Result"
    And I wait 2 seconds
    
   @javascript
   Scenario: See Find People With Work History fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info | cipher  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds

   @javascript
   Scenario: See Find People With Education fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education | be |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    Then I should see "Search Result"    
    And I should see "Search Result"
    And I wait 2 seconds

   @javascript
   Scenario: See Find People With Age fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I select "18" from "user_age_from"
    And I select "25" from "user_age_to"
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds
   
   @javascript
   Scenario: See Find People With Sex fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I choose "user_sex_male"
    And I wait 2 seconds
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds
    
   @javascript
   Scenario: See Find People With Sex fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I choose "user_sex_female"
    And I wait 2 seconds
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds

   @javascript
   Scenario: See Find People With Internet Interest fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet | net savy |
    | user_about_me |  |
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds
    
   @javascript
   Scenario: See Find People With About Me fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me | a cool dude |
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds

   @javascript
   Scenario: See Find People With All Filled Fields fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username | sal |
    | user_tab | myfav  |
    | user_work_info | cipher |
    | user_education | be |
    | user_interest_internet | net savy |
    | user_about_me | a cool dude |
    When I select "18" from "user_age_from"
    And I select "25" from "user_age_to"
    When I choose "user_sex_male"
    And I wait 2 seconds 
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds

   @javascript
   Scenario: See Find People With Blank Fields fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I wait 2 seconds
    And I should be on the my account page 
    And I go to the find people page
    Then I should see "Find People"
    When I follow "Find People"
    And I have data in user detail
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    Then I should see "Search Result"
    And I should see "Search Result"
    And I wait 2 seconds
