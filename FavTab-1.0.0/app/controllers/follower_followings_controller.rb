class FollowerFollowingsController < ApplicationController
  before_filter :login_required

  # GET /follower_followings
  # GET /follower_followings.xml
  def index
    @follower_followings = FollowerFollowing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @follower_followings }
    end
  end

  # GET /follower_followings/1
  # GET /follower_followings/1.xml
  def show
    @follower_following = FollowerFollowing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @follower_following }
    end
  end

  # GET /follower_followings/new
  # GET /follower_followings/new.xml
  def new
    @follower_following = FollowerFollowing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @follower_following }
    end
  end

  # GET /follower_followings/1/edit
  def edit
    @follower_following = FollowerFollowing.find(params[:id])
  end

  # POST /follower_followings
  # POST /follower_followings.xml
  def create
    @follower_following = FollowerFollowing.new(params[:follower_following])

    respond_to do |format|
      if @follower_following.save
        format.html { redirect_to(@follower_following, :notice => 'Follower following was successfully created.') }
        format.xml  { render :xml => @follower_following, :status => :created, :location => @follower_following }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @follower_following.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /follower_followings/1
  # PUT /follower_followings/1.xml
  def update
    @follower_following = FollowerFollowing.find(params[:id])

    respond_to do |format|
      if @follower_following.update_attributes(params[:follower_following])
        format.html { redirect_to(@follower_following, :notice => 'Follower following was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @follower_following.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /follower_followings/1
  # DELETE /follower_followings/1.xml
  def destroy
    @follower_following = FollowerFollowing.find(params[:id])
    @follower_following.destroy

    respond_to do |format|
      format.html { redirect_to(follower_followings_url) }
      format.xml  { head :ok }
    end
  end
end
