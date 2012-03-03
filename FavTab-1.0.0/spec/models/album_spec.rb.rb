require 'spec_helper'

describe Album do
  before(:each) do
    @album = Album.new(:name=> 'My Photos', :user_id=> 2, :share_type => 0 )
  end


  it "should be invalid without a album name" do
    @album.name = nil
    @album.should_not be_valid
    @album.errors[:name].should include("Can't be blank. ")
    @album.name = "My Pics"
    @album.should be_valid
  end

  it "should be invalid with a album name more than 20" do
    @album.name = "a"*21
    @album.should_not be_valid
    @album.errors[:name].should include("is too long (maximum is 20 characters)")
    @album.name = "a"*20
    @album.should be_valid
  end


end