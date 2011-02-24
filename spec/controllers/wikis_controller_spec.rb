require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe WikisController do

  def mock_wiki(stubs={})
    @mock_wiki ||= mock_model(Wiki, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all wikis as @wikis" do
      Wiki.stub(:all) { [mock_wiki] }
      get :index
      assigns(:wikis).should eq([mock_wiki])
    end
  end

  describe "GET show" do
    it "assigns the requested wiki as @wiki" do
      Wiki.stub(:find).with("37") { mock_wiki }
      get :show, :id => "37"
      assigns(:wiki).should be(mock_wiki)
    end
  end

  describe "GET new" do
    it "assigns a new wiki as @wiki" do
      Wiki.stub(:new) { mock_wiki }
      get :new
      assigns(:wiki).should be(mock_wiki)
    end
  end

  describe "GET edit" do
    it "assigns the requested wiki as @wiki" do
      Wiki.stub(:find).with("37") { mock_wiki }
      get :edit, :id => "37"
      assigns(:wiki).should be(mock_wiki)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created wiki as @wiki" do
        Wiki.stub(:new).with({'these' => 'params'}) { mock_wiki(:save => true) }
        post :create, :wiki => {'these' => 'params'}
        assigns(:wiki).should be(mock_wiki)
      end

      it "redirects to the created wiki" do
        Wiki.stub(:new) { mock_wiki(:save => true) }
        post :create, :wiki => {}
        response.should redirect_to(wiki_url(mock_wiki))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved wiki as @wiki" do
        Wiki.stub(:new).with({'these' => 'params'}) { mock_wiki(:save => false) }
        post :create, :wiki => {'these' => 'params'}
        assigns(:wiki).should be(mock_wiki)
      end

      it "re-renders the 'new' template" do
        Wiki.stub(:new) { mock_wiki(:save => false) }
        post :create, :wiki => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested wiki" do
        Wiki.stub(:find).with("37") { mock_wiki }
        mock_wiki.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :wiki => {'these' => 'params'}
      end

      it "assigns the requested wiki as @wiki" do
        Wiki.stub(:find) { mock_wiki(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:wiki).should be(mock_wiki)
      end

      it "redirects to the wiki" do
        Wiki.stub(:find) { mock_wiki(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(wiki_url(mock_wiki))
      end
    end

    describe "with invalid params" do
      it "assigns the wiki as @wiki" do
        Wiki.stub(:find) { mock_wiki(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:wiki).should be(mock_wiki)
      end

      it "re-renders the 'edit' template" do
        Wiki.stub(:find) { mock_wiki(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested wiki" do
      Wiki.stub(:find).with("37") { mock_wiki }
      mock_wiki.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the wikis list" do
      Wiki.stub(:find) { mock_wiki }
      delete :destroy, :id => "1"
      response.should redirect_to(wikis_url)
    end
  end

end
