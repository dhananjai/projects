class TabSitesController < ApplicationController
  before_filter :login_required

  # GET /tab_sites
  # GET /tab_sites.xml
  def index
    @tab_sites = TabSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tab_sites }
    end
  end

  # GET /tab_sites/1
  # GET /tab_sites/1.xml
  def show
    @tab_site = TabSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tab_site }
    end
  end

  # GET /tab_sites/new
  # GET /tab_sites/new.xml
  def new
    @tab_site = TabSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tab_site }
    end
  end

  # GET /tab_sites/1/edit
  def edit
    @tab_site = TabSite.find(params[:id])
  end

  # POST /tab_sites
  # POST /tab_sites.xml
  def create
    @tab_site = TabSite.new(params[:tab_site])

    respond_to do |format|
      if @tab_site.save
        format.html { redirect_to(@tab_site, :notice => 'Tab site was successfully created.') }
        format.xml  { render :xml => @tab_site, :status => :created, :location => @tab_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tab_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tab_sites/1
  # PUT /tab_sites/1.xml
  def update
    @tab_site = TabSite.find(params[:id])

    respond_to do |format|
      if @tab_site.update_attributes(params[:tab_site])
        format.html { redirect_to(@tab_site, :notice => 'Tab site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tab_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tab_sites/1
  # DELETE /tab_sites/1.xml
  def destroy
    @tab_site = TabSite.find(params[:id])
    @tab_site.destroy

    respond_to do |format|
      format.html { redirect_to(tab_sites_url) }
      format.xml  { head :ok }
    end
  end
end
