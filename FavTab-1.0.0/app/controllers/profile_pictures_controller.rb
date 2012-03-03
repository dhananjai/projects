class ProfilePicturesController < ApplicationController
  before_filter :login_required

  # GET /profile_pictures
  # GET /profile_pictures.xml
  def index
    @profile_pictures = ProfilePicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_pictures }
    end
  end

  # GET /profile_pictures/1
  # GET /profile_pictures/1.xml
  def show
    @profile_picture = ProfilePicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_picture }
    end
  end

  # GET /profile_pictures/new
  # GET /profile_pictures/new.xml
  def new
    @profile_picture = ProfilePicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_picture }
    end
  end

  # GET /profile_pictures/1/edit
  def edit
    @profile_picture = ProfilePicture.find(params[:id])
  end

  # POST /profile_pictures
  # POST /profile_pictures.xml
  def create
    @profile_picture = ProfilePicture.new(params[:profile_picture])

    respond_to do |format|
      if @profile_picture.save
        format.html { redirect_to(@profile_picture, :notice => 'Profile picture was successfully created.') }
        format.xml  { render :xml => @profile_picture, :status => :created, :location => @profile_picture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_pictures/1
  # PUT /profile_pictures/1.xml
  def update
    @profile_picture = ProfilePicture.find(params[:id])

    respond_to do |format|
      if @profile_picture.update_attributes(params[:profile_picture])
        format.html { redirect_to(@profile_picture, :notice => 'Profile picture was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_pictures/1
  # DELETE /profile_pictures/1.xml
  def destroy
    @profile_picture = ProfilePicture.find(params[:id])
    @profile_picture.destroy

    respond_to do |format|
      format.html { redirect_to(profile_pictures_url) }
      format.xml  { head :ok }
    end
  end
end
