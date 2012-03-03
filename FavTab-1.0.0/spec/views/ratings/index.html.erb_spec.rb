require 'spec_helper'

describe "ratings/index.html.erb" do
  before(:each) do
    assign(:ratings, [
      stub_model(Rating,
        :rate => 1,
        :user_id => 1,
        :rateable_id => 1,
        :rateable_type => "Rateable Type"
      ),
      stub_model(Rating,
        :rate => 1,
        :user_id => 1,
        :rateable_id => 1,
        :rateable_type => "Rateable Type"
      )
    ])
  end

  it "renders a list of ratings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rateable Type".to_s, :count => 2
  end
end
