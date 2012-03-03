class Album < ActiveRecord::Base
  has_many :pictures,:dependent => :destroy
  belongs_to :user
  validates :name, :presence => {:message => "Album name can't be blank. "}, :length => {:maximum => 20}, :uniqueness => {:scope => :user_id}

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 16/02/2012
  #Purpose:
  #++ This method is used to get all pictures that should be visible to user
  def show_photo_per_album
    Picture.find(:all, :conditions=>["album_id=?", self.id], :limit=>9)
  end


  #--
  #Created by: Satish Zol
  #Created on: 16/02/2012
  #Purpose:This method is used to View all pictures that should be shared in group and in public
  #++ 
  def shared_pictures(u_id,page)
    per_page = 20
    off = (page-1)*per_page
    return Picture.find(:all, :conditions => ['album_id=?', self.id],:offset => off, :limit => per_page,:order => "created_at DESC")if self.user_id == u_id
    pictures = Picture.find_by_sql(["SELECT distinct p.* from(albums a LEFT JOIN pictures p ON a.id=p.album_id LEFT JOIN shared_tabs s_t ON p.id = s_t.shareable_id AND 'Picture' = s_t.shareable_type LEFT JOIN groups g ON g.id=s_t.group_id LEFT JOIN group_users gu ON g.id=gu.group_id) WHERE ( (p.share_type=0 OR a.user_id=? OR (p.share_type=2 AND gu.user_id=?) OR (p.share_type=1 AND a.user_id=?)) AND a.id=?) ORDER BY p.created_at DESC LIMIT ? OFFSET ? ",u_id, u_id, u_id, self.id,per_page, off ])
    pictures.uniq!
    pictures
  end
end
