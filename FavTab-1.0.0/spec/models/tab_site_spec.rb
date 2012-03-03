require 'spec_helper'

describe TabSite do

  before(:each) do
    @tab_site = TabSite.new(:id=>1,:tab_id =>1, :site_url=>"http://www.google.com")
  end

  it "should be invalid without a site url" do
    @tab_site.site_url = ""
    @tab_site.should_not be_valid
    @tab_site.errors[:site_url].should include("can't be blank.")
    @tab_site.site_url = "http://www.google.com"
    @tab_site.should be_valid
  end

  it "should be invalid with invalid site url" do
    @tab_site.site_url = "google.com"
    @tab_site.site_url.should_not match(/^(ht|f)tps?:\/\/[a-z0-9-\.]+\.[a-z]{2,4}\/?([^\s<>\#%"\,\{\}\\|\\\^\[\]`]+)?$/)
    @tab_site.should_not be_valid
    @tab_site.errors[:site_url].should include("is invalid")
    @tab_site.site_url = 'http://www.google.com'
    @tab_site.site_url.should match(/^(ht|f)tps?:\/\/[a-z0-9-\.]+\.[a-z]{2,4}\/?([^\s<>\#%"\,\{\}\\|\\\^\[\]`]+)?$/)
    @tab_site.should be_valid
  end

  it "should be invalid with site url of more than 300 character" do
    @tab_site.site_url = "http://www.google"+"a"*301+".com"
    @tab_site.should_not be_valid
    @tab_site.errors[:site_url].should include("is too long (maximum is 300 characters)")
    @tab_site.site_url = 'http://www.google.com'
    @tab_site.should be_valid
  end

  it "should be valid number of urls under a tab" do
    @tab_site = TabSite.create(:tab_id =>1, :site_url=>"http://www.google.com")
    @tab_site.should be_valid
    @tab_site = TabSite.new(:tab_id =>1, :site_url=>"http://www.google.com")
    TabSite.stub!(:count).and_return(100)
    @tab_site.should_not be_valid
    @tab_site.errors[:base].should include("Only 100 sites can be create under one tab.")
  end

  it "should return the title of a site if present otherwise showing url itself" do
    @tab_site = TabSite.new(:site_url => 'http://www.google.com')
    @tab_site.site_title.should eql("http://www.google.com")
    @tab_site = TabSite.create(:site_url => 'http://www.google.com', :title => "Google")
    @tab_site.site_title.should eql("Google")
  end

  it "should add the title of a site to site url" do
    @tab_site = TabSite.create(:site_url => 'http://www.google.com')
    @tab_site.site_title.should eql("Google")
  end

end
