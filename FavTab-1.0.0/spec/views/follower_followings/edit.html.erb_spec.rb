require 'spec_helper'

describe "follower_followings/edit.html.erb" do
  before(:each) do
    @follower_following = assign(:follower_following, stub_model(FollowerFollowing,
      :follower_id => 1,
      :following_id => 1
    ))
  end

  it "renders the edit follower_following form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => follower_followings_path(@follower_following), :method => "post" do
      assert_select "input#follower_following_follower_id", :name => "follower_following[follower_id]"
      assert_select "input#follower_following_following_id", :name => "follower_following[following_id]"
    end
  end
end
