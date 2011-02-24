require 'spec_helper'

describe "wikis/index.html.haml" do
  before(:each) do
    assign(:wikis, [
      stub_model(Wiki,
        :page => "Page",
        :name => "Name",
        :content => "Content"
      ),
      stub_model(Wiki,
        :page => "Page",
        :name => "Name",
        :content => "Content"
      )
    ])
  end

  it "renders a list of wikis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Page".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
