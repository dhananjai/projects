  Feature: My Discussions in profile page
    In order to test My discussion functionality in profile page

   @javascript
   Scenario: See My discussion area in Profile page
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should see "My Discussions"
    And I should see "My Comments"
    And I should see "URL:*"
    And I should see "Discuss"

   @javascript
   Scenario: See My Comments area in Profile page
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should see "My Discussions" within "[@id='my_discussion_header']"
    When I follow "My Comments"
    And I wait 2 seconds
    And I should see "My Comments" within "[@id='my_discussion_header']"
    And I should see "Discuss"

   @javascript
   Scenario: To test the validation for discussion
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should see "My Discussions" within "[@id='my_discussion_header']"
    When I fill in the following:
     | discussion_url |  |
    And I press "Discuss"
    Then I should see "Please enter url."
    When I fill in the following:
     | discussion_url | abcd |
    And I press "Discuss"
    Then I should see "Please enter valid url."
    When I fill in the following:
     | discussion_url | www.google.com |
    And I press "Discuss"
    And I wait 5 seconds
    Then I should see "Discussion posted sucessfully."

   @javascript
   Scenario: To test the discussion is posted
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should see "My Discussions" within "[@id='my_discussion_header']"
    When I fill in the following:
     | discussion_url | http://www.google.com |
    And I press "Discuss"
    And I wait 5 seconds
    Then I should see "Google"
    And I should see "Post Comment"


   @javascript
   Scenario: See post comment functionality
   Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    When I fill in the following:
     | discussion_url | http://www.google.com |
    And I press "Discuss"
    And I wait 5 seconds
    Then I should see "Google"
    And I should see "Post Comment"
    And I follow "Post Comment"
    And I should see "Cancel"
    When I fill in the following:
     | comment_comment | Hi HI HI hI hI hi hi |
    And I wait 3 seconds
    And I follow "post_discussion_comment"
    And I wait 5 seconds
    And I should see "Comment posted sucessfully."

   @javascript
   Scenario: See post comment functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    When I fill in the following:
     | discussion_url | http://www.google.com |
    And I press "Discuss"
    And I wait 5 seconds
    Then I should see "Google"
    And I should see "Post Comment"
    And I follow "Post Comment"
    And I should see "Cancel"
    When I follow "Cancel"
     And I wait 2 seconds
    Then I should not see "comment_comment"

   @javascript
   Scenario: See My comments functionality
    Given I am on the home page
    And I have logged in as user with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    And I go to the my account page
    And I have user named "satish" email "satish.zol@cipher-tech.com" and password "satish123"  with discussion "http://www.google.com"
    And I follow "Discussion"
    And I wait 1 seconds
    And I should be on the discussions page
    Then I should see "Google"
    And I should see "Post Comment"
    And I follow "Post Comment"
    And I should see "cancel"
    When I fill in the following:
     | comment_comment | This is my first comment |
    And I follow "post_discussion_comment"
    And I wait 3 seconds
    And I should see "Comment posted sucessfully."
    When I go to the my account page
    And I follow "My Comments"
    And I wait 2 seconds
    Then I should see "This is my first comment"