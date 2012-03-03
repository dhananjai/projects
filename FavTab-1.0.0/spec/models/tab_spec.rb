require 'spec_helper'

describe Tab do

  before(:each) do
    @tabs = Tab.new(:id=>1,:user_id =>1, :name=>"Google")
  end

  it "should be invalid without a tab name" do
    @tabs.name = ''
    @tabs.should_not be_valid
    @tabs.name = 'google'
    @tabs.should be_valid
  end

  it "should be invalid with tab name more than 50 character" do
    @tabs.name = 'a'*51
    @tabs.should_not be_valid
    @tabs.name = 'google'
    @tabs.should be_valid
  end

  it "should collect tab urls" do
    @tab = Tab.create(:user_id =>1, :name=>"General Sites")
    @tab_site = TabSite.create(:tab_id => @tab.id, :site_url=>"http://www.google.com")
    @tab_site = TabSite.create(:tab_id =>@tab.id, :site_url=>"http://www.yahoo.com")
    @tab.sites.should eql("http://www.google.com http://www.yahoo.com")
  end

  it "should split bulk of urls and add to tab_sites" do
    @tab = Tab.create(:user_id =>1, :name=>"General Sites")
    old_count = TabSite.count
    site_urls = "http://www.google.com\n\rhttp://www.yahoo.com\n\rhttp://www.yahoo.com"
    @tab.add_bulk_sites(site_urls)
    TabSite.count.should eql(old_count+3)
  end

end
