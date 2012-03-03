class Notifier < ActionMailer::Base
  default :from => "demo@cipher-tech.com",
          :bcc => ["salil@cipher-tech.com"]


  def confirm_user(user)
    @username= user.username
    @sent_on =  Time.now
    mail(:to => user.email,
         :subject => 'Welcome To FavTabs')
  end

  def mail_to_user(user, host)
    @username = user.username
    @url  = "http://"+host+"/logins/activate/#{user.confirmation_token}"
    mail(:to => user.email,
         :subject => 'Thanks For Registering! Confirm Your Email')
  end

  #Created by: Satish Zol
  #Created on: 07/01/2012
  #Purpose:
  #++ This method is send a mail to new message
  def msg_mail_to_user(message)
    @message = message.message
    @sent_on =  Time.now
    mail(:to => message.recipient.email,
      :subject => "#{message.sender.username} sent message for you")
  end

  #Created by: Deepali Thaokar
  #Created on: 09/01/2012
  #Purpose:
  #++ This method is send a mail to discussion poster
  def mail_to_user_on_discussion(comment,discussion_poster)
    @comment = comment
		@discussion_url = comment.discussion.url
		@discussion_user = comment.user.username
    @sent_on =  Time.now
      mail(:to => discussion_poster.email,
        :subject => "comment on your discussion #{@discussion_url}")
  end

  #Created by: Jalendra Bhanarkar
  #Created on: 12/01/2012
  #Purpose:
  #++ This method used to send new password
  def send_password(user, newpass)
    @message = "Your new password is "+newpass
    @sent_on =  Time.now
    mail(:to => user.email,
         :subject => 'Your password has been changed.')
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 23/01/2012
  #Purpose:
  #++ This method is used to send an email to followers of user who marked email updates when user
  # add discussion.
  def mail_to_follower(follower_following, discussion)
    @discussion = discussion
    @author = follower_following.following
    @sent_on =  Time.now
    mail(:to => follower_following.follower.email,
         :subject => 'New Discussion.')
  end

  #Created by: Satish Zol
  #Created on: 29/02/2012
  #Purpose:
  #++ This method is send a mail to new message
  def mail_to_user_on_photo_comment(photo_comment)
    @photo_comment = photo_comment.comment
    @photo_comment_username = photo_comment.user.username
    @sent_on =  Time.now
    mail(:to => photo_comment.discussable.album.user.email,
      :subject => "comment on your photo #{@photo_comment}")
  end

end
