require 'spec_helper'

describe "follower_followings/show.html.erb" do
  before(:each) do
    @follower_following = assign(:follower_following, stub_model(FollowerFollowing,
      :follower_id => 1,
      :following_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
