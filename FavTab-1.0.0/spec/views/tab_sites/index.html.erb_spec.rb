require 'spec_helper'

describe "tab_sites/index.html.erb" do
  before(:each) do
    assign(:tab_sites, [
      stub_model(TabSite,
        :tab_id => 1,
        :site_url => "Site Url"
      ),
      stub_model(TabSite,
        :tab_id => 1,
        :site_url => "Site Url"
      )
    ])
  end

  it "renders a list of tab_sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Site Url".to_s, :count => 2
  end
end
