require 'spec_helper'

describe "wikis/show.html.haml" do
  before(:each) do
    @wiki = assign(:wiki, stub_model(Wiki,
      :page => "Page",
      :name => "Name",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Page/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
