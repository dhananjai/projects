require 'spec_helper'

describe "ratings/edit.html.erb" do
  before(:each) do
    @rating = assign(:rating, stub_model(Rating,
      :rate => 1,
      :user_id => 1,
      :rateable_id => 1,
      :rateable_type => "MyString"
    ))
  end

  it "renders the edit rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ratings_path(@rating), :method => "post" do
      assert_select "input#rating_rate", :name => "rating[rate]"
      assert_select "input#rating_user_id", :name => "rating[user_id]"
      assert_select "input#rating_rateable_id", :name => "rating[rateable_id]"
      assert_select "input#rating_rateable_type", :name => "rating[rateable_type]"
    end
  end
end
