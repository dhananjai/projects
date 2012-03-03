require 'mime/types'

class ProfilePicture < ActiveRecord::Base
  belongs_to  :user

   before_save :normalize_file_name
   #paperclip
  has_attached_file :photo, :path => ":rails_root/public/profile_pictures/photos/:id/:style_:basename.:extension",
    :url => "/profile_pictures/photos/:id/:style_:basename.:extension",
    :styles => {
    :small  => "25x25>",
    :medium=> "50x50#",
    :large=> "140x140#" }, :whiny => false


   validates_attachment_size  :photo, :less_than => 3.megabytes, :message => "Please upload picture upto 3MB file size."
   validates_attachment_content_type :photo, :content_type =>['image/jpeg','image/pjpeg', 'image/png','image/x-png', 'image/bmp', 'image/jpg'], :message => "Please uplaod file of format .jpg, .png, .bmp, .jpeg."
   validates_attachment_presence :photo, :message => "Please choose a file to upload."


  #for normalize the file name while uploading the photo(remove spaces)
  private
  def normalize_file_name
    self.instance_variable_get(:@_paperclip_attachments).keys.each do |attachment|
      attachment_file_name = (attachment.to_s + '_file_name').to_sym
      if self.send(attachment_file_name)
        self.send(attachment).instance_write(:file_name, self.send(attachment_file_name).gsub(/ /,'_'))
      end
    end
  end


 end
