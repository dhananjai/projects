class DiscussionsController < ApplicationController
  before_filter :login_required
  include  DiscussionsHelper
  before_filter :other_user_check, :only => [:load_my_comments, :load_my_discussions]

  #Created by: Deepali Thaokar
  #Created on: 07/01/2012
  #Purpose:
  #++ This method is used for display discussion
  def index
    if @login_user.is_admin?
      redirect_to :action => "all_discussion"
    else
      @other_user = @login_user
      @latest_user_discussion = @login_user.user_discussions.order('created_at desc').limit('1')
	    @lastest_discussion = @latest_user_discussion[0].discussion if !@latest_user_discussion.blank?
	    #@discussions = @login_user.discussions.order('created_at desc')
      @discussions = @login_user.discussions.find(:all,:offset => 0, :limit => 10,:order => "created_at DESC")
      @most_pop_discussions = Discussion.most_popular((Time.now - 0.50.hours), Time.now)
	    @feeds  = @login_user.feed(Time.now-1.week,Time.now)

#      @feeds = Array.new
#      @feeds = (@ff + @tab_sites + @comments + @user_discussions + @shared_tabs + @shared_pics).sort { |a,b|
#        if a.updated_at && b.updated_at
#          response = 0
#          if a.updated_at > b.updated_at then response = -1 end
#          if b.updated_at > a.updated_at then response = 1 end
#          response
#        end
#      }
    end
  end

  

  #Created by: Deepali Thaokar
  #Created on: 07/01/2012
  #Purpose:
  #++ This method is used to create discussion
  def create_discussion
    @message = @login_user.add_discussion?(params[:discussion]) ? "Discussion posted sucessfully." : "Discussion is already posted."
    @lastest_discussion = @login_user.discussions.order('created_at desc').limit('1')
    respond_to do |format|
      format.js
    end
  end
  

  #Created by: Deepali Thaokar
  #Created on: 07/01/2012
  #Purpose:
  #++ This method is used to post comments
  def post_comments
    if params[:comment]
      @comments = Comment.new(params[:comment])
      @comments.user_id = current_user.id
      if @is_saved = @comments.save
        @discussion= @comments.discussion
       @notice="Comment posted sucessfully."
        @comments.discussion.users.each do |discussion_poster|
           Notifier.mail_to_user_on_discussion(@comments,discussion_poster).deliver if discussion_poster.id!=current_user.id
        end
      else
        @notice = @comments.errors.full_messages.to_sentence unless @comments.save#"Comment not able to comment"
      end
      respond_to do |format|
        format.js
      end
    end
  end


  def post_comment_responses
    @comments = Comment.new(params[:response_comment])
    @comments.user_id = current_user.id
    if @is_saved = @comments.save
      @discussion= @comments.discussion
      @notice = "Comment posted sucessfully."
      @comments.discussion.users.each do |discussion_poster|
          Notifier.mail_to_user_on_discussion(@comments,discussion_poster).deliver if discussion_poster.id!=current_user.id
      end
    else
      @notice = @comments.errors.full_messages.to_sentence unless @comments.save
    end
    respond_to do |format|
      format.js
    end
  end

  #Created by: Satish Zol
  #Created on: 11/01/2012
  #Purpose: #++ This method is used for update self posted comments
  def update_comment_responses
    @comments = Comment.find(params[:response_comment][:id])
    if @comments.user_id
      if @comments.update_attributes(:comment => params[:response_comment][:comment])
        @notice="Comment updated sucessfully."
        #redirect_to :action=>'index'
        @comments.discussion.users.each do |discussion_poster|
          Notifier.mail_to_user_on_discussion(@comments,discussion_poster).deliver
        end
        #render :partial => "inner_comment", :locals=>{:response=>@comments}
        respond_to do |format|
          format.js
        end
      else
        @notice ="Comment not updated."
        #redirect_to :action=>'index'
        #render :text => params[:response_comment]
        respond_to do |format|
          format.js
        end
      end
    else
      @notice = "Wrong user"
      render :text => params[:response_comment]
    end
  end


  #Created by: Satish Zol
  #Created on: 11/01/2012
  #Purpose: #++ This method is used for delete self posted comments

  def delete_comment
    @comment = Comment.find(params[:id])
    if @login_user.is_admin?
      if delete_children_comments(@comment)
        @notice="Comment deleted sucessfully."
        render :text => "Success"
      end
    else
      if @comment.children.blank? && @comment.destroy
        @notice=" posted comment delete sucessfully."
        render :text => "Success"
      else
        @notice="Comment not able to delete"
        #redirect_to :action=>'index'
        render :text => params[:response_comment]
      end
    end
  end


  # GET /discussions/new GET /discussions/new.xml
  def new
    @discussion = Discussion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end



  # PUT /discussions/1
  # PUT /discussions/1.xml
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to(@discussion, :notice => 'Discussion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discussion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.xml
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to(discussions_url) }
      format.xml  { head :ok }
    end
  end



  #Created by: Jalendra Bhanarkar
  #Created on: 10/01/2012
  #Purpose:
  #++ This method is used load all comments
  def load_comments
    @discussion = Discussion.find(params[:id].to_i)
    render :partial => "all_comments", :locals=>{:discussion=>@discussion}, :layout => false
  end

  #Created by: Satish Zol
  #Created on: 10/01/2012
  #Purpose:
  #++ This method is used for display all discussion throughout system
  def all_discussion
    @most_pop_discussions = Discussion.most_popular((Time.now - 30.day), Time.now,1)
  end

  #Created by: Jalendra Bhanarkar
  #Created on: 11/01/2012
  #Purpose:
  #++ This method is used load all discussions with my coments
  def load_my_comments
    #@mycomments = Comment.find(:all,:select=>"discussion_id",:group=>"discussion_id", :conditions=>["user_id=?", params[:id]], :order=>"updated_at" )
    #d_ids = Array.new
    #@mycomments.each do |my_c|
    #  d_ids << my_c.discussion_id
    #end
    #@discussions = Discussion.find_all_by_id(d_ids)
    @other_user = User.find_by_id(params[:id].to_i)
    @discussions = @other_user.commented_discussions(1)
    render :partial => "my_comments", :locals=>{:discussion=>@discussions}, :layout => false
  end

  
  #Created by: Jalendra Bhanarkar
  #Created on: 11/01/2012
  #Purpose:
  #++ This method is used load all discussions with my coments
  def load_my_discussions
    @user = User.find_by_id(params[:id].to_i)
    @discussions = @user.discussions.find(:all,:offset => 0, :limit => 10,:order => "created_at DESC")
    render :partial => "my_discussions", :locals=>{:discussions=>@discussions,:direct=>false}, :layout => false
  end

  #Created by: Satish Zol
  #Created on: 11/01/2012
  #Purpose:
  #++ This method is used for display discussion
  def load_discussion_as_per_time
    page = params[:page] ? params[:page].to_i : 1
    start_time = case params[:id]
    when "30min" then Time.now - 0.50.hours
    when "day" then Time.now - 1.day
    when "week" then Time.now - 1.week
    when "year" then Time.now - 1.year
    else Time.now - 30.day
    end
    puts "Start Time: #{start_time}"
    @most_pop_discussions = Discussion.most_popular(start_time, Time.now,page, params[:order_by]=="ratings")
    render :partial => "all_discussion_as_selction", :locals=>{:most_pop_discussions=>@most_pop_discussions}, :layout => false
  end

  #Created by: Jalendra
  #Created on: 13/01/2012
  #Purpose:
  #++ This method is used deleting discussion
  def delete_discussion
    if(@login_user.is_admin?)
      @discussion = Discussion.find(params[:id])
      if @discussion.destroy
        render :text=>"Success"
      else
        render :text=>"Fail"
      end
    end
  end


  #Created by: Jalendra
  #Created on: 13/01/2012
  #Purpose:
  #++ This method is used deleting comment tree
  def delete_children_comments(comment)
    if comment.children.count>0
      comment.children.each do |children|
        delete_children_comments(children)
      end
    end
    return true if comment.destroy
  end

  #Created by: Salil
  #Created on: 23/01/2012
  #Purpose:
  #++ This method is used to join discussio functionality of the Updates From Followed Members Page
  def join_discussion
    @discussion = Discussion.find(params[:id])
    @login_user.add_discussion?({:url => @discussion.url})
    @message = "Discussion joined successfully."
    respond_to do |format|
      format.js  
    end
  end

  #Created by: Jalendra
  #Created on: 21/02/2012
  #Purpose:
  #++ This method is used load my discussions
  def load_my_discussions_on_scroll
    per_page = 10
    off = (params[:page].to_i-1)*per_page
    @user = User.find_by_id(params[:id].to_i)
    @discussions = @user.discussions.find(:all,:offset => off, :limit => per_page,:order => "created_at DESC")
    respond_to do |format|
      format.js
    end
  end

  #Created by: Jalendra
  #Created on: 21/02/2012
  #Purpose:
  #++ This method is used load my discussions
  def load_most_pop_discussions_on_scroll
    @most_pop_discussions = Discussion.most_popular((Time.now - 0.50.hours), Time.now,params[:page].to_i)
    #@discussions = @login_user.discussions.find(:all,:offset => off, :limit => per_page,:order => "created_at DESC")
    respond_to do |format|
      format.js
    end
  end

  #Created by: Jalendra
  #Created on: 22/02/2012
  #Purpose:
  #++ This method is used load my comments
  def load_my_comments_on_scroll
    @other_user = User.find_by_id(params[:id].to_i)
    @discussions = @other_user.commented_discussions(params[:page].to_i)
  end

  #Created by: Jalendra
  #Created on: 22/02/2012
  #Purpose:
  #++ This method is used load my discussions
  def show_discussion
    @discussion = Discussion.find(params[:id])
    render :partial => "show_discussion", :locals=>{:discussion=>@discussion}
  end


  def load_more_feeds
    page = params[:page].to_i
    from = Time.now - page.week
    to = Time.now - (page - 1).week
    @feeds  = @login_user.feed(from,to)
#    @feeds = Array.new
#    @feeds = (@ff + @tab_sites + @comments + @user_discussions + @shared_tabs + @shared_pics).sort { |a,b|
#      if a.updated_at && b.updated_at
#        response = 0
#        if a.updated_at > b.updated_at then response = -1 end
#        if b.updated_at > a.updated_at then response = 1 end
#        response
#      end
#    }
    respond_to do |format|
      format.js
    end
  end

end
