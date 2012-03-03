class PhotoCommentObserver < ActiveRecord::Observer

  def after_save(photo_comment)
    Notifier.mail_to_user_on_photo_comment(photo_comment).deliver if photo_comment.user_id != photo_comment.discussable.album.user_id
  end

end
