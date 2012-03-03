require 'spec_helper'

describe "profile_pictures/index.html.erb" do
  before(:each) do
    assign(:profile_pictures, [
      stub_model(ProfilePicture,
        :user_id => 1,
        :filename => "Filename",
        :size => 1,
        :content_type => "Content Type",
        :thumbnail => "Thumbnail",
        :parent_id => 1
      ),
      stub_model(ProfilePicture,
        :user_id => 1,
        :filename => "Filename",
        :size => 1,
        :content_type => "Content Type",
        :thumbnail => "Thumbnail",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of profile_pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Thumbnail".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
