class AlbumPicture < ActiveRecord::Base
  belongs_to :album
  belongs_to :picture
end
