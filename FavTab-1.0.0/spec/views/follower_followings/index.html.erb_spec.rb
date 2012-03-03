require 'spec_helper'

describe "follower_followings/index.html.erb" do
  before(:each) do
    assign(:follower_followings, [
      stub_model(FollowerFollowing,
        :follower_id => 1,
        :following_id => 1
      ),
      stub_model(FollowerFollowing,
        :follower_id => 1,
        :following_id => 1
      )
    ])
  end

  it "renders a list of follower_followings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
