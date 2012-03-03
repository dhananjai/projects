require 'spec_helper'

describe "tab_sites/edit.html.erb" do
  before(:each) do
    @tab_site = assign(:tab_site, stub_model(TabSite,
      :tab_id => 1,
      :site_url => "MyString"
    ))
  end

  it "renders the edit tab_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tab_sites_path(@tab_site), :method => "post" do
      assert_select "input#tab_site_tab_id", :name => "tab_site[tab_id]"
      assert_select "input#tab_site_site_url", :name => "tab_site[site_url]"
    end
  end
end
