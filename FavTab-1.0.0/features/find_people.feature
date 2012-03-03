  Feature: Find People in Process
    In order to test all Find People functionality 
    as an user
    I want various following scenarios.
  
   @javascript
   Scenario: See Find People link in section
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I am on the find people page
		
   @javascript
   Scenario: See Find People UI
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I am on the find people page
    When I follow "Find People"
    And I should see "Username"
    And I should see "Tab"
    And I should see "Work History"
    And I should see "Education"
    And I should see "Age"
    And I should see "Sex"
    And I should see "Internet Interest"
    And I should see "About Me"
    Then I should see "Search" button
    

   @javascript
   Scenario: See Find People With Username fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I am on the find people page
    When I follow "Find People"
    And I have user with name "abc" and email "yuiy@vassda.com" and password "abc123456" and system_role 10
#    And I have user with name "bca" and email "qer@rwe.com" and password "abc123456" and system_role 10
#    And I have user with name "cda" and email "xvc@gdghr.com" and password "abc123456" and system_role 10
#    And I have user with name "efg" and email "fgf@sdfg.com" and password "abc123456" and system_role 10
#    And I have user with name "zsd" and email "asdf@wre.com" and password "abc123456" and system_role 10
    When I fill in the following:
    | user_username | a |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result"  
    When I follow "other_username"
    Then I am on the my account page  
    And I wait 5 seconds
   
    @javascript
   Scenario: See Find People With Tab fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I am on the my account page 
#    And I have tab uname "cda" and email "xvc@gdghr.com" and password "abc123456" and name "myfav3" and user_id 4 and share_type 1
    And I have tab uname "abc" and email "yuiy@vassda.com" and password "abc123456" and name "myfav2" and user_id 2 and share_type 0
    And I am on the find people page
    When I follow "Find People"
    When I fill in the following:
    | user_username |  |
    | user_about_me |  |
    | user_tab | myf |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    And I wait 3 seconds
    And I press "search_submit"
    And I wait 3 seconds
    And I should see "Search Result"  
    When I follow "other_username"
    Then I am on the my account page 
    And I wait 5 seconds
    
   @javascript
   Scenario: See Find People With Work History fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I have user details uname "abc" and email "yuiy@vassda.com" and password "abc123456" and work_info "infosys" and user_id 2 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info | info  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result" 
    When I follow "other_username"
    Then I am on the my account page   
    And I wait 5 seconds

   @javascript
   Scenario: See Find People With Education fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I have user details uname "abc" and email "yuiy@vassda.com" and password "abc123456" and education "be" and user_id 2     
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education | be |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result"   
    When I follow "other_username"
    Then I am on the my account page   
    And I wait 5 seconds

   @javascript
   Scenario: See Find People With Age fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "abc" and email "yuiy@vassda.com" and password "abc123456" and age 18 and user_id 2   
#    And I have user details uname "cba" and email "dhf@vasssda.com" and password "abc123456" and age 30 and user_id 3
#    And I have user details uname "cbsadfa" and email "asd@vasssda.com" and password "abc123456" and age 25 and user_id 4   
     When I fill in the following:
    | user_age_from | 18 |
    | user_age_to | 25 |

    #When I select "18" from "user_age_from"
    #And I select "25" from "user_age_to"
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result"  
    When I follow "other_username"
    Then I am on the my account page    
    And I wait 5 seconds
   
   @javascript
   Scenario: See Find People With Sex fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "abc" and email "yuiy@vassda.com" and password "abc123456" and sex "male" and user_id 2   
    When I choose "user_sex_male"
    And I wait 2 seconds
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result" 
    When I follow "other_username"
    Then I am on the my account page     
    And I wait 5 seconds
    
   @javascript
   Scenario: See Find People With Sex fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "cbsadfa" and email "asd@vasssda.com" and password "abc123456" and sex "female" and user_id 4  
    When I choose "user_sex_female"
    And I wait 2 seconds
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result"  
    When I follow "other_username"
    Then I am on the my account page     
    And I wait 5 seconds

   @javascript
   Scenario: See Find People With Internet Interest fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "cbsadfa" and email "asd@vasssda.com" and password "abc123456" and interest_internet "net savy" and user_id 4  
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet | net savy |
    | user_about_me |  |
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result" 
    When I follow "other_username"
    Then I am on the my account page        
    And I wait 5 seconds
    
   @javascript
   Scenario: See Find People With About Me fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "cbsadfa" and email "asd@vasssda.com" and password "abc123456" and about_me "a cool dude" and user_id 4  
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me | a cool dude |
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result" 
    When I follow "other_username"
    Then I am on the my account page     
    And I wait 5 seconds

   @javascript
   Scenario: See Find People With All Filled Fields fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "salil" and email "asd@vasssda.com" and password "abc123456" and name "myfav3" and share_type 0 and work_info "cipher" and education "be" and age 18 and sex "male" and interest_internet "net savy" and about_me "a cool dude" and user_id 4  
    When I fill in the following:
    | user_username | salil |
    | user_tab | myfav3  |
    | user_work_info | cipher |
    | user_education | be |
    | user_interest_internet | net savy |
    | user_about_me | a cool dude |
    When I select "18" from "user_age_from"
    And I select "25" from "user_age_to"
    When I choose "user_sex_male"
    And I wait 2 seconds 
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result"
    When I follow "other_username"
    Then I am on the my account page        
    And I wait 5 seconds
    
   @javascript
   Scenario: See Find People With Blank Fields fuctionality
    Given I am on the home page
    And I have logged in as user with named "satish" and email "satish@cipher-tech.com" and password "satish"
    When I press "Sign In"
    And I wait 2 seconds
    And I am on the my account page 
    And I go to the find people page
    And I am on the find people page
    When I follow "Find People"
    And I have user details uname "cbsadfa" and email "asd@vasssda.com" and password "abc123456" 
    When I fill in the following:
    | user_username |  |
    | user_tab |  |
    | user_work_info |  |
    | user_education |  |
    | user_interest_internet |  |
    | user_about_me |  |
    And I press "search_submit"
    And I wait 2 seconds
    And I should see "Search Result"   
    And I wait 5 seconds
