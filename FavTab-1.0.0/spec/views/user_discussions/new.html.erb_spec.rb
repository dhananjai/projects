require 'spec_helper'

describe "user_discussions/new.html.erb" do
  before(:each) do
    assign(:user_discussion, stub_model(UserDiscussion,
      :user_id => 1,
      :discussion_id => 1
    ).as_new_record)
  end

  it "renders new user_discussion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_discussions_path, :method => "post" do
      assert_select "input#user_discussion_user_id", :name => "user_discussion[user_id]"
      assert_select "input#user_discussion_discussion_id", :name => "user_discussion[discussion_id]"
    end
  end
end
