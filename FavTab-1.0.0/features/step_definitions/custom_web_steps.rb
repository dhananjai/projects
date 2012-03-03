# Satish Zol
#For default sign in.
Given /^I sign in as basic user$/ do 
  @user = User.create!(:email => "abc@abc.com", :encrypted_password => "password", :username => "name", :system_role => 10 )
  @user.save
  @user.account_status = "active"
  @user.save
  @user_detail = @user.build_user_detail
  #@user.update_attribute()
 
  fill_in "user_loginname", :with=> "name"
  fill_in "user_loginpassword", :with=> "password"
  
  click_button("sign_in")
  #page.evaluate_script(["document.forms.submit()"])
end

Given /^I have data in user detail$/ do
 @user_detail = UserDetail.create!(:id => 1,
 				   :work_info => "cipher", 
                     		   :education => "be", 
                                   :age => "26", 
                                   :sex => "male", 
                                   :interest_internet => "net savy", 
                                   :about_me => "a cool dude", 
                                   :user_id =>@user.id )
  @user_detail.save
  end

# Deepali Thaokar
#To wait for defined seconds.
When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

# Jalendra Bhanarkar
# For defining an normal user
When /^I have user name "([^"]*)" and email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  @user = User.create(:email => email, :username => name, :encrypted_password => password, :system_role => 10)
  @user_detail = @user.build_user_detail
  @user.activate
end

When /^I am sign in as user name "([^"]*)" and password "([^"]*)"$/ do |name, password|
  fill_in "user_loginname", :with => name
  fill_in "user_loginpassword", :with => password
  
end


When /^I have user with name "([^"]*)" and email "([^"]*)" and password "([^"]*)" and system_role (\d+)$/ do |name, email, password, system_role|
  @user = User.create(:username => name, :email => email, :encrypted_password => password, :system_role => system_role)
  @user_detail = @user.build_user_detail
  @user.activate
end


# Jalendra Bhanarkar
# user login
Given /^I have logged in as user with named "([^"]*)" and email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  @user = User.create(:email => email, :username => name, :encrypted_password => password, :system_role => 10)
  @user_detail = @user.build_user_detail
  @user.activate
  fill_in 'user_loginname', :with => name
  fill_in 'user_loginpassword', :with => password
end

# Jalendra Bhanarkar
# For defining an admin user
Given /^I have admin user named "([^"]*)" and email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  @user = User.create(:email => email, :username => name, :encrypted_password => password, :system_role => 90)
  @user_detail = @user.build_user_detail
  @user.activate
end

# Jalendra Bhanarkar
# admin login
Given /^I have logged in as admin with named "([^"]*)" and email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  @user = User.create(:email => email, :username => name, :encrypted_password => password, :system_role => 90)
  @user_detail = @user.build_user_detail
  @user.activate
  fill_in 'user_loginname', :with => name
  fill_in 'user_loginpassword', :with => password
end


When /^I submit the form$/ do
  page.evaluate_script(["document.forms[0].submit()"])
end



Given /^I have discussion$/ do 
    @discussion = Discussion.new(:url=>"http://www.xyz.com")
    @user_discussion = @discussion.user_discussions(:url=>"http://www.xyz.com").build
    @user_discussion.user_id = @user.id
    @user.add_discussion?(:url=>"http://www.xyz.com")
end



Given /^I have user named "([^"]*)" email "([^"]*)" and password "([^"]*)"  with discussion "([^"]*)"$/ do |name,email,password,url|
    user = User.create(:email => email, :username => name, :encrypted_password => password, :system_role => 10)
    user_detail = user.build_user_detail
    user.activate
    discussion = Discussion.new(:url=>url)
    user_discussion = discussion.user_discussions(:url=>url).build
    user_discussion.user_id = user.id
    user.add_discussion?(:url=>url)
    comments = Comment.create(:comment=>"hello",:user_id=>user.id,:discussion_id=>(UserDiscussion.find(:first,:conditions=>["user_id=?",user.id])).id)
end

Given /^I accept confirm popup$/ do
  page.driver.browser.switch_to.alert.accept
end


Given /^I have tab "([^"]*)"/ do |name|
    @tab = Tab.create(:name=>name,:user_id=>@user.id)
end

Given /^I have site "([^"]*)"/ do |url|
    @site = TabSite.create(:site_url=>url,:tab_id=>@tab.id)
end

When /^I have tab uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and name "([^"]*)" and user_id (\d+) and share_type (\d+)$/ do |uname, email, password, name, user_id, share_type|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user_detail = @user.build_user_detail
  @user.activate
 @tab = Tab.create!(:name => name, :user_id => @user.id, :share_type => share_type )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and work_info "([^"]*)" and user_id (\d+)$/ do |uname, email, password, work_info, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate
 @user_details = UserDetail.create!(:work_info => work_info, :user_id => @user.id )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and education "([^"]*)" and user_id (\d+)$/ do |uname, email, password, education, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate
 @user_details = UserDetail.create!(:education => education, :user_id => @user.id )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and age (\d+) and user_id (\d+)$/ do |uname, email, password, age, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate
 @user_details = UserDetail.create!(:age => age, :user_id => @user.id )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and sex "([^"]*)" and user_id (\d+)$/ do |uname, email, password, sex, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate
 @user_details = UserDetail.create!(:sex => sex, :user_id => @user.id )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and interest_internet "([^"]*)" and user_id (\d+)$/ do |uname, email, password, interest_internet, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate
 @user_details = UserDetail.create!(:interest_internet => interest_internet, :user_id => @user.id )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and about_me "([^"]*)" and user_id (\d+)$/ do |uname, email, password, about_me, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate
 @user_details = UserDetail.create!(:about_me => about_me, :user_id => @user.id )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)" and name "([^"]*)" and share_type (\d+) and work_info "([^"]*)" and education "([^"]*)" and age (\d+) and sex "([^"]*)" and interest_internet "([^"]*)" and about_me "([^"]*)" and user_id (\d+)$/ do |uname, email, password, name, share_type, work_info, education, age, sex, interest_internet, about_me, user_id|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
 @user.build_user_detail
 @user.activate
 @user_details = UserDetail.create!(:work_info => work_info,
                                    :education => education,
                                    :age => age,
                                    :sex => sex,
                                    :interest_internet => interest_internet,
                                    :about_me => about_me, 
                                    :user_id => @user.id )
 @tab = Tab.create!(:name => name, :user_id => @user.id, :share_type => share_type )
end

When /^I have user details uname "([^"]*)" and email "([^"]*)" and password "([^"]*)"$/ do |uname, email, password|
 @user = User.create(:username => uname, :email => email, :encrypted_password => password, :system_role => 10)
  @user.build_user_detail
  @user.activate

end

#To see the button on page
Then /^I should see "([^"]*)" button/ do |name|
  find_button(name).should_not be_nil
end


When /^"([^"]*)" is following me$/ do | uname |
 user = User.create(:username => uname, :email => "satish.zol@cipher-tech.com", :encrypted_password => "password", :system_role => 10)
  user_detail = user.build_user_detail
  user.activate
  FollowerFollowing.create(:follower_id => user.id, :following_id => @user.id)
end

When /^I have group named "([^"]*)"$/ do | name |
  Group.create(:name=>name, :user_id=>@user.id)
end

### To check the mouse over
When /^I hover over "([^"]*)"$/ do |selector|
    page.execute_script("$('.album_actions').show().animate({'height':'15px'},'fast')")
end

When /^I hover over picture "([^"]*)"$/ do |selector|
    page.execute_script("$('.photo_actions').show().animate({'height':'23px'},'fast')")
end

When /^I should see the image title "(.+)"$/ do |image|
    page.should have_xpath("//img[contains(@title, \"#{image}\")]")
end

When /^I should see the image "(.+)"$/ do |image|
    page.should have_xpath("//img[contains(@src, \"#{image}\")]")
end

#To See div id
Then /^I should see div id "([^"]*)"$/ do |id|
  page.has_xpath?("//div[@id=id]")
end

When /^I have album name "([^"]*)" and user_id (\d+) and share_type (\d+)$/ do |name, user_id, share_type|
  @album = Album.create!(:name => name, :user_id => @user.id, :share_type => share_type)
end 


