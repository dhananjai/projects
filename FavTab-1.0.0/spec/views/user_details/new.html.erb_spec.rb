require 'spec_helper'

describe "user_details/new.html.erb" do
  before(:each) do
    assign(:user_detail, stub_model(UserDetail,
      :work_info => "MyText",
      :education => "MyText",
      :age => 1,
      :sex => "MyString",
      :interest_internet => "MyText",
      :about_me => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new user_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_details_path, :method => "post" do
      assert_select "textarea#user_detail_work_info", :name => "user_detail[work_info]"
      assert_select "textarea#user_detail_education", :name => "user_detail[education]"
      assert_select "input#user_detail_age", :name => "user_detail[age]"
      assert_select "input#user_detail_sex", :name => "user_detail[sex]"
      assert_select "textarea#user_detail_interest_internet", :name => "user_detail[interest_internet]"
      assert_select "textarea#user_detail_about_me", :name => "user_detail[about_me]"
      assert_select "input#user_detail_user_id", :name => "user_detail[user_id]"
    end
  end
end
