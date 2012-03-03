require 'spec_helper'

describe "discussions/index.html.erb" do
  before(:each) do
    assign(:discussions, [
      stub_model(Discussion,
        :url => "Url"
      ),
      stub_model(Discussion,
        :url => "Url"
      )
    ])
  end

  it "renders a list of discussions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
