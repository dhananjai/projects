require 'spec_helper'

describe UserDetail do
  before(:each) do
    @user_detail = UserDetail.new(:age => 18, :work_info => 'IT', :education => 'BE', :interest_internet => 'Entertainment', :about_me => 'Simple Guy')
  end

  it "should be invalid with a non-integer age" do
    @user_detail.age = 'Twenty'
    @user_detail.should_not be_valid
    @user_detail.errors[:age].should include("Age must be between 18 and 100.")
    @user_detail.age = 18
    @user_detail.should be_valid
  end

  it "should be invalid with a age less than 18" do
    @user_detail.age = 16
    @user_detail.should_not be_valid
    @user_detail.errors[:age].should include("Age must be between 18 and 100.")
    @user_detail.age = 18
    @user_detail.should be_valid
  end

  it "should be invalid with a age greater than 100" do
    @user_detail.age = 101
    @user_detail.should_not be_valid
    @user_detail.errors[:age].should include("Age must be between 18 and 100.")
    @user_detail.age = 18
    @user_detail.should be_valid
  end

  it "should be invalid with a work_info greater than 600" do
    @user_detail.work_info = 'a'*601
    @user_detail.should_not be_valid
    @user_detail.errors[:work_info].should include("Work History should be upto 600 character.")
    @user_detail.work_info = 'a'*600
    @user_detail.should be_valid
  end

  it "should be invalid with a education greater than 600" do
    @user_detail.education= 'a'*601
    @user_detail.should_not be_valid
    @user_detail.errors[:education].should include("Education should be 600 character.")
    @user_detail.education = 'a'*600
    @user_detail.should be_valid
  end

  it "should be invalid with a interest_internet greater than 600" do
    @user_detail.interest_internet = 'a'*601
    @user_detail.should_not be_valid
    @user_detail.errors[:interest_internet].should include("Internet Interest should be 600 character.")
    @user_detail.interest_internet = 'a'*600
    @user_detail.should be_valid
  end

  it "should be invalid with a about_me greater than 600" do
    @user_detail.about_me = 'a'*201
    @user_detail.should_not be_valid
    @user_detail.errors[:about_me].should include("About me should be 200 character.")
    @user_detail.about_me = 'a'*200
    @user_detail.should be_valid
  end















end
