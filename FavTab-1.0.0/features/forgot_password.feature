Feature: Forgot password process
    In order to test forgot password functionality
    for an user
    I want various following scenarios.

@javascript
   Scenario: See forgot password link
    Given I am on the home page
    And I should see "Forgot Password?"

@javascript
   Scenario: See forgot password form
    Given I am on the home page
    And I should see "Forgot Password?"
    When I follow "Forgot Password?"
    Then I should see "Enter your email"
@javascript
   Scenario: Hide forgot password form
    Given I am on the home page
    And I should see "Forgot Password?"
    When I follow "Forgot Password?"
    Then I should see "Enter your email"
    When I follow "Cancel"
    Then I should see "Already have an account"

@javascript
   Scenario: To check forgot password form validation and functionality
    Given I have user named "Jalendra" and email "jalendra.bhanarkar@cipher-tech.com" and password "12345678"
    And I am on the home page
    When I follow "Forgot Password?"
    Then I should see "Enter your email"
    When I fill in the following:
    | user_email_id | dsfsfds |
    When I follow "Submit"
    Then I should see "Please enter valid email"
    When I fill in the following:
    | user_email_id | jalendra.bhanarkar@cipher-tech.com |
    And I follow "Submit"
    Then I should be on the home page

