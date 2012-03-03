Feature: Admin user functionality 
    In order to test admins  functionality
    I want various following scenarios.

@javascript
   Scenario: Login with admins credential
    Given I have admin user named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    And I am on the home page
    When I fill in the following:
    | user_loginname | Jalendra |
    | user_loginpassword | 12345678 |
    When I press "Sign In"
    Then I should be on the my account page


@javascript
   Scenario: See discussion page
    Given I am on the home page
    And I have logged in as admin with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should not see "Following"
    And I should not see "Followers"
    #And I should not see "My Discussions"
    And I have user named "satish" email "satish.zol@cipher-tech.com" and password "satish123"  with discussion "http://www.google.com"
    And I follow "Discussion"
    Then I should be on the all discussion page
    And I should not see "Post Comment"
    #And I should not see "Rate It"
    And I should see "Delete"

@javascript
   Scenario: Delete discussions
    Given I am on the home page
    And I have logged in as admin with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should not see "Following"
    And I should not see "Followers"
    #And I should not see "My Discussions"
    And I have user named "satish" email "satish.zol@cipher-tech.com" and password "satish123"  with discussion "http://www.google.com"
    And I follow "Discussion"
    Then I should be on the all discussion page
    And I should not see "Post Comment"
    #And I should not see "Rate It"
    And I should see "Delete"
    When I follow "Delete"
    And I accept confirm popup
    And I wait 2 seconds
    Then I should see "Discussion deleted successfully."

@javascript
   Scenario: Delete comment
    Given I am on the home page
    And I have logged in as admin with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should not see "Following"
    And I should not see "Followers"
    #And I should not see "My Discussions"
    And I have user named "satish" email "satish.zol@cipher-tech.com" and password "satish123"  with discussion "http://www.google.com"
    And I follow "Discussion"
    Then I should be on the all discussion page
    And I should not see "Post Comment"
    #And I should not see "Rate It"
    And I should see "Delete" within "[@class='comments_div']"
    And I follow "toogle_comment"
    And I wait 1 seconds
    When I follow "Delete" within "[@class='comments_div']"
    And I accept confirm popup
    And I wait 2 seconds
    Then I should see "Comment deleted successfully."

@javascript
   Scenario: Delete comment
    Given I am on the home page
    And I have logged in as admin with named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    When I press "Sign In"
    Then I should be on the my account page
    And I should not see "Following"
    And I should not see "Followers"
    #And I should not see "My Discussions"
    And I have user named "satish" email "satish.zol@cipher-tech.com" and password "satish123"  with discussion "http://www.google.com"
    And I follow "Discussion"
    Then I should be on the all discussion page
    And I should not see "Post Comment"
    #And I should not see "Rate It"
    And I should see "Delete" within "[@class='comments_div']"
    And I follow "toogle_comment"
    And I wait 1 seconds
    When I follow "profile_image_link"
    Then I should see "satish's Discussions" within "[@id='my_discussion_header']"
