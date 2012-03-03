require 'spec_helper'

describe "discussions/edit.html.erb" do
  before(:each) do
    @discussion = assign(:discussion, stub_model(Discussion,
      :url => "MyString"
    ))
  end

  it "renders the edit discussion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discussions_path(@discussion), :method => "post" do
      assert_select "input#discussion_url", :name => "discussion[url]"
    end
  end
end
