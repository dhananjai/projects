  Feature: Message in Process
    In order to test all Message functionality 
    as an user
    I want various following scenarios.
  
   @javascript
   Scenario: See Message link in section
    Given I am on the home page
    And I sign in as basic user
    And I wait 5 seconds
    And I should be on the my account page 
    Then I should see "Messages"
		

   @javascript
   Scenario: See Message UI
    Given I am on the home page
    And I sign in as basic user
    And I should be on the my account page 
    Then I should see "Message"
    When I follow "Messages"
    Then I should see "New Message"
    And I should see "Inbox"
    And I should see "Sent Messages"
    

   @javascript
   Scenario: See Inbox fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I go to the Messages page 
    Then I should see "Inbox"
    Then I follow "Inbox"
    And I should see "All Incomming messages"
    And I should see "Username"
    When I follow "Username"
    Then I should see "Other user profile"
    And I should see "profie pic of other user"
    When I follow "Username"
    Then I should see "Other user profile"
    And I should see "Reply"
    And I should see "Delete"
    When I follow "Reply"
    Then I should see "Cancel"
    And I should see "reply_msg_box"
    And I should see "send"
    When I fill in the following:
    | msgtextfield | Hi to all |
    And I press "Send"
    Then I should see "Message sent successfully"
    Then I follow "Sent Message"
    And I should see "Recent sent message first"
    Then I follow "Delete"
    And I should see "confirmation_popup"
    Then I press "Yes"
    Then I should see "Message deleted successfully"
 
   
   @javascript
   Scenario: See Sent fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I go to the Messages page 
    Then I should see "Sent"
    Then I follow "Sent"
    And I should see "All Sent messages"
    And I should see "Username"
    When I follow "Username"
    Then I should see "Other user profile"
    And I should see "profie pic of other user"
    When I follow "Username"
    Then I should see "Other user profile"
    And I should see "Delete"
    Then I follow "Delete"
    And I should see "confirmation_popup"
    Then I press "Yes"
    Then I should see "Message deleted successfully"
      
   @javascript
   Scenario: See New Message fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I go to the Messages page 
    Then I should see "New Message"
    And I should see "to_field"
    And I should see "message_field"
    And I check "new_message_select_from_f_n_f"
    Then I should see "list of username from followers and followings"
    When I fill in the following:
    | To | Satish, Salil, Jalendra, Deepali |
    | Message | hi how ru? |
    Then I press "Send"
    Then I should see "Message sent successfully"
    Then I follow "Sent Messages"
    And I should see "hi how ru? message"
    And I follow "logout"
    Then I should see "home page"
    
   @javascript
   Scenario: See New Message From Other User fuctionality
    Given I am on the home page
    And I sign in as basic user
    And I go to the Messages page 
    Then I follow "Inbox"
    And I should see "new message"
    
     
    
    
    
        
    

