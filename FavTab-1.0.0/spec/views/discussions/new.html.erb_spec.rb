require 'spec_helper'

describe "discussions/new.html.erb" do
  before(:each) do
    assign(:discussion, stub_model(Discussion,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new discussion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discussions_path, :method => "post" do
      assert_select "input#discussion_url", :name => "discussion[url]"
    end
  end
end
