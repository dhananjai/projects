require 'spec_helper'

describe User do
  
  before(:each) do
    @user = User.new(:email=>'a@b.com', :encrypted_password => 'some_passowrd', :username=>"someusername")
  end

  it "should be invalid without a email" do
    @user.email = ''
    @user.should_not be_valid
    @user.errors[:email] == "cannot be blank."
  end

  it "should be invalid without a encrypted_password" do
    @user.encrypted_password = ''
    @user.should_not be_valid
    @user.errors[:encrypted_password] == "cannot be blank."
  end

=begin
  it "should be invalid with a encrypted_password more than 20 or less than 6 characters" do
    @user.encrypted_password = 'a'*5
    @user.should_not be_valid
    @user.encrypted_password = 'a'*21
    @user.should_not be_valid
    @user.encrypted_password = 'a'*11
    @user.should be_valid
  end
=end


  it "should be invalid with a email more than 100 characters" do
    @user.email = 'a'*101
    @user.should_not be_valid
    @user.email = 'a'*100
    @user.should be_valid
  end

  it "should be invalid without a username" do
    @user.username = ''
    @user.should_not be_valid
    @user.errors[:username] == "cannot be blank."
  end

  it "should be invalid with a username more than 50 characters" do
    @user.username = 'a'*51
    @user.should_not be_valid
  end

  it "should be valid with a username less than 51 characters" do
    @user.username = 'a'*50
    @user.should be_valid
  end

  it "should return nil when username, passowrd doesn't match" do
    @user = User.create(:email=>'a@b.com', :encrypted_password => 'some_passowrd', :username=>"someusername")
    User.authenticate("someusername", 'some_passowrd').should eql(nil)
  end

  it "should return nil when user is not active for user whose username, passowrd match" do
    @user = User.create(:email=>'a@b.com', :encrypted_password => 'some_passowrd', :username=>"someusername")
    User.authenticate("someusername", 'some_passowrd').should eql(nil)
  end

  it "should return nil when user is active for user whose username, passowrd match" do
    @user = User.create(:email=>'a@b.com', :encrypted_password => 'some_passowrd', :username=>"someusername")
    @user.activate
    User.authenticate("someusername", 'some_passowrd').should eql(@user)
  end

  it "should activate user and allow to login" do
    @user = User.create(:email=>'a@b.com', :encrypted_password => 'some_passowrd', :username=>"someusername")
    @user.confirmation_token.should_not be_nil
    @user.account_status.should eql('pending')
    @user.activate
    @user.confirmation_token.should be_nil
    @user.account_status.should eql('active')
  end

  it "should be invalid if username already present" do
    @user = User.create(:email=>'a@b.com', :encrypted_password => 'some_passowrd', :username=>"uniqueusername", :account_status => 'active')
    @user.should be_valid
    @other_user = User.create(:email=>'aasd@b.com', :encrypted_password => 'some_passowrd', :username=>"uniqueusername", :account_status => 'active')
    @other_user.should_not be_valid
  end

  it "should return inbox/sent messages for user which is not deleted by user in respective section" do
    @sender = User.create(:email=>'sender@b.com', :encrypted_password => 'some_passowrd', :username=>"senderusername", :account_status => 'active')
    @receiver = User.create(:email=>'receiver@b.com', :encrypted_password => 'some_passowrd', :username=>"receiverusername", :account_status => 'active')
    Message.create(:receiver_id => @receiver.id, :sender_id => @sender.id, :deleted_by_receiver => true, :deleted_by_sender => false, :message => "Hi")
    Message.create(:receiver_id => @receiver.id, :sender_id => @sender.id, :deleted_by_receiver => false, :deleted_by_sender => false, :message => "Hi")
    Message.create(:receiver_id => @receiver.id, :sender_id => @sender.id, :deleted_by_receiver => false, :deleted_by_sender => true, :message => "Hi")
    @receiver.inbox_messages.length.should eql(2)
    @sender.inbox_messages.length.should eql(0)
    @receiver.sent_messages.length.should eql(0)
    @sender.sent_messages.length.should eql(2)
  end

  it "should return true/false depending on user active or not" do
    @active = User.create(:email=>'active@b.com', :encrypted_password => 'some_passowrd', :username=>"activeusername")
    @pending = User.create(:email=>'pending@b.com', :encrypted_password => 'some_passowrd', :username=>"pendingusername")
    @active.activate
    @active.is_active?.should be_true
    @pending.is_active?.should be_false
  end 

  it "should return true/false depending on user active or not" do
    @admin = User.create(:email=>'admin@b.com', :encrypted_password => 'some_passowrd', :username=>"adminusername", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @user = User.create(:email=>'user@b.com', :encrypted_password => 'some_passowrd', :username=>"userusername", :system_role => User::SYSTEM_ROLE_USER)
    @admin.is_admin?.should be_true
    @user.is_admin?.should be_false
    @admin.is_user?.should be_false
    @user.is_user?.should be_true
  end 

  it "should find all the users available for the login user to whom he/she can send message" do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @login_user.activate
    @active_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER).activate
    @inactive_user = User.create(:email=>'inactive_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometexttwo", :system_role => User::SYSTEM_ROLE_USER)
    @admin_user = User.create(:email=>'admin@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextthree", :system_role => User::SYSTEM_ROLE_ADMIN_USER).activate
    @login_user.all_message_users('sometext').length.should eql(1)
  end 

  it "should find all the users to who either follows login user or followed by login user" do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @login_user.activate
    @active_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @inactive_user = User.create(:email=>'inactive_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometexttwo", :system_role => User::SYSTEM_ROLE_USER)
    @admin_user = User.create(:email=>'admin@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextthree", :system_role => User::SYSTEM_ROLE_ADMIN_USER).activate
    @login_user.from_follower_following('sometext').length.should eql(0)
    @active_user.activate
    FollowerFollowing.create(:following_id => @login_user.id, :follower_id => @active_user.id)
    @log_user = User.find @login_user
    @log_user.from_follower_following('sometext').length.should eql(1)
  end 

  it "should find the people using different non blank parameteres" do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @login_user.activate
    @active_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @active_user_detail = @active_user.build_user_detail({'work_info'=>'Cipher Technologies', 'education' => 'BE', 'interest_internet'=> 'NEWS', 'about_me'=> 'Girl', 'sex' =>'female', 'age' =>25})
    @active_user.save
    @active_user.activate
    @log_user = User.find @login_user
    option = {'username' =>'some', 'work_info'=>'Cipher', 'education' => 'BE', 'interest_internet'=>'NEWS', 'about_me' => 'Girl', 'sex' =>'female', 'age_to' =>28, 'age_from' =>18}
    @log_user.search_query(option).length.should eql(1)
  end

  it "show thumbnail for different size " do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @login_user.profile_pic(:small).should eql("/images/profile_image.jpg")
    @pic=ProfilePicture.create(:photo_file_name => "profile.jpg", :photo_file_size => 8774, :photo_content_type => "image/jpeg", :user_id => @login_user.id)
    @log_user = User.find @login_user
    File.stub(:exist?).and_return(true)
    @log_user.profile_pic(:small).should eql("/profile_pictures/photos/#{@pic.id}/small_profile.jpg")
    @log_user.profile_pic(:medium).should eql("/profile_pictures/photos/#{@pic.id}/medium_profile.jpg")
    @log_user.profile_pic(:large).should eql("/profile_pictures/photos/#{@pic.id}/large_profile.jpg")
  end

  it "return the path of the user's profile "  do
    @profile_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_USER)
    @log_user = User.find @profile_user
    @log_user.profile_path.should eql("/users/profile/#{@log_user.id}")
  end

  it "should return true/false depending on whether user follows param users or not " do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @other_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @log_user = User.find @login_user
    @oth_user = User.find @other_user
    @log_user.is_following?(@oth_user.id).should be_false
    FollowerFollowing.create(:following_id => @other_user.id, :follower_id => @login_user.id)
    @log_user.is_following?(@oth_user.id).should be_true
  end 

  it "should return true/false depending on whether param user follows users or not " do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @other_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @log_user = User.find @login_user
    @oth_user = User.find @other_user
    @log_user.is_follower?(@oth_user.id).should be_false
    FollowerFollowing.create(:following_id => @login_user.id, :follower_id => @other_user.id)
    @log_user.is_follower?(@oth_user.id).should be_true
  end 

  it "should return the username " do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @log_user = User.find @login_user
    @log_user.login.should eql('sometextlogin')
  end 

  it "should return false when login user is admin " do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @log_user = User.find @login_user
    @log_user.is_rater?(Comment.new).should be_false
  end

  it "should return true/false when login user is of type user and already rate the comment/discussion or not" do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_USER)
    @other_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @discussion = Discussion.create(:url => "http://www.google.com")
    UserDiscussion.create(:user_id => @other_user.id, :discussion_id => @discussion.id)
    @comment = Comment.create(:user_id => @other_user.id, :discussion_id => @discussion.id, :comment => "Hello")
    @log_user = User.find @login_user
    @log_user.is_rater?(@discussion).should be_false
    @log_user.is_rater?(@comment).should be_false
  end

  it "should return true/false depending on whether param user follows users or not " do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @other_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @log_user = User.find @login_user
    @oth_user = User.find @other_user
    @log_user.is_email_update?(@oth_user.id).should be_false
    FollowerFollowing.create(:following_id => @other_user.id, :follower_id => @login_user.id, :get_email_updates => true)
    @log_user.is_email_update?(@oth_user.id).should be_true
  end 

  it "should add discussion if not already present" do
    old_count = UserDiscussion.count
    disc_count = Discussion.count
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_ADMIN_USER)
    @log_user = User.find @login_user
    @login_user.add_discussion?({:url =>"http://www.abc.com"}).should be_true
    UserDiscussion.count.should eql(old_count+1)
    Discussion.count.should eql(disc_count+1)
    @login_user.add_discussion?({:url =>"http://www.abc.com"}).should be_nil
    UserDiscussion.count.should eql(old_count+1)
    Discussion.count.should eql(disc_count+1)
    @other_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @oth_user = User.find @other_user
    @oth_user.add_discussion?({:url =>"http://www.abc.com"}).should be_true
    UserDiscussion.count.should eql(old_count+2)
    Discussion.count.should eql(disc_count+1)
  end 

end
