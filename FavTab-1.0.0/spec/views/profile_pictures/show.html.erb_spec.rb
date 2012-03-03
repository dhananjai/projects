require 'spec_helper'

describe "profile_pictures/show.html.erb" do
  before(:each) do
    @profile_picture = assign(:profile_picture, stub_model(ProfilePicture,
      :user_id => 1,
      :filename => "Filename",
      :size => 1,
      :content_type => "Content Type",
      :thumbnail => "Thumbnail",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Filename/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Thumbnail/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
