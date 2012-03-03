require 'spec_helper'

describe Discussion do
  before(:each) do
    @discussion = Discussion.new(:id=>1, :url=>"http://www.google.com")
  end

  it "should be invalid without a discussion url" do
    @discussion.url = ""
    @discussion.should_not be_valid
    @discussion.errors[:url].should include("can't be blank.")
    @discussion.url = "http://www.google.com"
    @discussion.should be_valid
  end

  it "should be invalid with invalid discussion url" do
    @discussion.url = "google.com"
    @discussion.url.should_not match(/^(ht|f)tps?:\/\/[a-z0-9-\.]+\.[a-z]{2,4}\/?([^\s<>\#%"\,\{\}\\|\\\^\[\]`]+)?$/)
    @discussion.should_not be_valid
    @discussion.errors[:url].should include("is invalid")
    @discussion.url = 'http://www.google.com'
    @discussion.url.should match(/^(ht|f)tps?:\/\/[a-z0-9-\.]+\.[a-z]{2,4}\/?([^\s<>\#%"\,\{\}\\|\\\^\[\]`]+)?$/)
    @discussion.should be_valid
  end

  it "should be invalid with discussion url of more than 300 character" do
    @discussion.url = "http://www.google"+"a"*301+".com"
    @discussion.should_not be_valid
    @discussion.errors[:url].should include("is too long (maximum is 300 characters)")
    @discussion.url = 'http://www.google.com'
    @discussion.should be_valid
  end

  it "find the total votes for the discussion" do
    @discussion = Discussion.create(:url => 'http://www.google.com')
    @rate_two = Rate.create(:score => 3)
    Rating.create(:rate_id => @rate_two.id, :rateable_id => @discussion.id, :rateable_type => 'Discussion', :user_id => 2)
    Rating.create(:rate_id => @rate_two.id, :rateable_id => @discussion.id, :rateable_type => 'Discussion', :user_id => 3) 
    @discussion.votes.should eql(2)
  end

  it "should return the title of a site if present otherwise showing url itself" do
    @discussion = Discussion.new(:url => 'http://www.google.com')
    @discussion.site_title.should eql("http://www.google.com")
    @discussion = Discussion.create(:url => 'http://www.google.com', :title => "Google")
    @discussion.site_title.should eql("Google")
  end

  it "should add the title of a site to site url" do
    @discussion = Discussion.create(:url => 'http://www.google.com')
    @discussion.site_title.should eql("Google")
  end

  it "should find the array of the users ids for the discussion" do
    @login_user = User.create(:email=>'login_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextlogin", :system_role => User::SYSTEM_ROLE_USER)
    @other_user = User.create(:email=>'active_user@b.com', :encrypted_password => 'some_passowrd', :username=>"sometextone", :system_role => User::SYSTEM_ROLE_USER)
    @discussion = Discussion.create(:url => 'http://www.google.com')
    UserDiscussion.create(:discussion_id => @discussion.id, :user_id => @login_user.id)
    UserDiscussion.create(:discussion_id => @discussion.id, :user_id => @other_user.id)
    @discussion = Discussion.find(@discussion)
    @discussion.user_ids.should include(@login_user.id, @other_user.id)
  end











end
