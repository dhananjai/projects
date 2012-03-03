class MessagesController < ApplicationController
  autocomplete :user, :username, :extra_data => [:id]
  
  before_filter :login_required
  layout 'message'
  # GET /messages GET /messages.xml

  #-- Created by: Satish Zol
 #Created on: 07/01/2012
 #Purpose: #++ This
 # method is used to show all the received message of the Inbox for User

  def index
    @received_msgs = @login_user.inbox_messages.paginate(:page => params[:page], :per_page => 12)
    @message = Message.new
  end

  #--Created by: Satish Zol
  #Created on: 07/01/2012
  #Purpose: #++ This method is used to show all the sent message of the Inbox for User
  def sent_messages
    @sent_msgs = @login_user.sent_messages.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /messages/1 GET /messages/1.xml
  #  def show
  #    @message = Message.find(params[:id])
  #
  #    respond_to do |format|
  #      format.html # show.html.erb
  #      format.xml  { render :xml => @message }
  #    end
  #  end

  # GET /messages/new GET /messages/new.xml
  def new_message
    session[:from_follower_following] = nil
    @message = Message.new
  end

  def from_follower_following
    session[:from_follower_following] = session[:from_follower_following] ? nil : true
    respond_to do |format|  
      format.js   { render :nothing => true }  
    end 
  end


  # GET /messages/1/edit
  #  def edit
  #    @message = Message.find(params[:id])
  #  end

  # POST /messages POST /messages.xml
  def create
    @recievers = params[:message][:receiver_ids]
    @recievers = @recievers.split(", ") if @recievers
    rec_ids = Array.new
    @recievers.each do |rec|
      rec_ids = User.find(:first,:conditions=>["username=?",rec])
      send_message(params[:message][:sender_id],rec_ids.id,params[:message][:message]) if !rec_ids.nil? and !rec_ids.is_admin?
      Notifier.msg_mail_to_user(@message).deliver if rec_ids and !rec_ids.is_admin? and @message.save
    end if @recievers
    #@message = Message.new(params[:message])
    #
    respond_to do |format|  
      format.js  
    end  
  end


  
  #--
  #Created by: Jalendra
  #Created on: 16-01-2012
  #Purpose   : To send the message
  #++
  def send_message(sender,reciever,message)
    @message = Message.new(:sender_id=>sender,:receiver_id=>reciever,:message=>message)
    @message if @message.save
  end


  # PUT /messages/1 PUT /messages/1.xml
  #  def update
  #    @message = Message.find(params[:id])
  #
  #    respond_to do |format|
  #      if @message.update_attributes(params[:message])
  #        format.html { redirect_to(@message, :notice => 'Message was successfully updated.') }
  #        format.xml  { head :ok }
  #      else
  #        format.html { render :action => "edit" }
  #        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
  #      end
  #    end
  #  end

  # DELETE /messages/1 DELETE /messages/1.xml
  #-- Created by: Satish Zol
  #Created on: 07/01/2012
  #Purpose: #++ This
  # method is used to delete message from Inbox and sent messages for User
  def message_delete
    @message = Message.find(params[:id])
    @message.delete_message(current_user.id)
    respond_to do |format|  
      format.js   { render :nothing => true }  
    end  
  end

end
