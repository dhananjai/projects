require 'spec_helper'

describe "tab_sites/show.html.erb" do
  before(:each) do
    @tab_site = assign(:tab_site, stub_model(TabSite,
      :tab_id => 1,
      :site_url => "Site Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Site Url/)
  end
end
