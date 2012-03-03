require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :comment => "MyText",
      :user_id => 1,
      :discussion_id => 1,
      :parent_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "textarea#comment_comment", :name => "comment[comment]"
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_discussion_id", :name => "comment[discussion_id]"
      assert_select "input#comment_parent_id", :name => "comment[parent_id]"
    end
  end
end
