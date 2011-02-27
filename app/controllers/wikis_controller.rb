class WikisController < ApplicationController
  
  # GET /wikis
  # GET /wikis.xml
  def index
    @title = 'Listing all pages'
    @wikis = Wiki.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wikis }
    end
  end

  # GET /wikis/1
  # GET /wikis/1.xml
  def show
    @title = params[:id] || 'FrontPage'
    @wiki = Wiki.where(:uri => @title.gsub(' ','_')).first
    @wikis = Wiki.all
    
    if @wiki.nil?
      @title.gsub('_',' ')
      redirect_to :controller => 'wikis', :action => 'new', :title => @title
    else
      @wiki.format_local_link
      #@wiki.content = textilize(@wiki.content).html_safe
    
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @wiki }
      end
    end
  end

  # GET /wikis/new
  # GET /wikis/new.xml
  def new
    @wiki = Wiki.new
    @wiki.name = params[:title]
    @title = "Creating #{@wiki.name}"
    @wikis = Wiki.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wiki }
    end
  end

  # GET /wikis/1/edit
  def edit
    page_to_edit = params[:id] || 'FrontPage'
    @wiki = Wiki.find(page_to_edit)
    @title = "Edit: #{@wiki.name}"
    
    respond_to do |format|
      format.js
      format.html
    end
  end

  # POST /wikis
  # POST /wikis.xml
  def create
    @wiki = Wiki.new(params[:wiki])
    @wiki.uri = @wiki.name.gsub(' ','_')

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to wiki_path(@wiki.uri), :notice => 'Wiki was successfully created.' }
        format.xml  { render :xml => @wiki, :status => :created, :location => @wiki }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wiki.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wikis/1
  # PUT /wikis/1.xml
  def update
    @wiki = Wiki.find(params[:id])

    respond_to do |format|
      if @wiki.update_attributes(params[:wiki])
        format.js
        format.html { redirect_to(wiki_path(@wiki.uri), :notice => 'Wiki was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wiki.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.xml
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy

    respond_to do |format|
      format.html { redirect_to(wikis_url) }
      format.xml  { head :ok }
    end
  end
end
