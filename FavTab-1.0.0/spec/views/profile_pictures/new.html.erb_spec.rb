require 'spec_helper'

describe "profile_pictures/new.html.erb" do
  before(:each) do
    assign(:profile_picture, stub_model(ProfilePicture,
      :user_id => 1,
      :filename => "MyString",
      :size => 1,
      :content_type => "MyString",
      :thumbnail => "MyString",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new profile_picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profile_pictures_path, :method => "post" do
      assert_select "input#profile_picture_user_id", :name => "profile_picture[user_id]"
      assert_select "input#profile_picture_filename", :name => "profile_picture[filename]"
      assert_select "input#profile_picture_size", :name => "profile_picture[size]"
      assert_select "input#profile_picture_content_type", :name => "profile_picture[content_type]"
      assert_select "input#profile_picture_thumbnail", :name => "profile_picture[thumbnail]"
      assert_select "input#profile_picture_parent_id", :name => "profile_picture[parent_id]"
    end
  end
end
