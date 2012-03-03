require 'spec_helper'

describe "user_discussions/index.html.erb" do
  before(:each) do
    assign(:user_discussions, [
      stub_model(UserDiscussion,
        :user_id => 1,
        :discussion_id => 1
      ),
      stub_model(UserDiscussion,
        :user_id => 1,
        :discussion_id => 1
      )
    ])
  end

  it "renders a list of user_discussions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
