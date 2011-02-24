require 'spec_helper'

describe "wikis/edit.html.haml" do
  before(:each) do
    @wiki = assign(:wiki, stub_model(Wiki,
      :page => "MyString",
      :name => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit wiki form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wikis_path(@wiki), :method => "post" do
      assert_select "input#wiki_page", :name => "wiki[page]"
      assert_select "input#wiki_name", :name => "wiki[name]"
      assert_select "input#wiki_content", :name => "wiki[content]"
    end
  end
end
