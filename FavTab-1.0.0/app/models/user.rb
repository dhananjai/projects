class User < ActiveRecord::Base
  has_one :user_detail
  has_many :followers, :class_name => 'FollowerFollowing', :foreign_key => 'following_id'
  has_many :followings, :class_name => 'FollowerFollowing', :foreign_key => 'follower_id'
  has_many :receivers, :class_name => 'Message', :foreign_key => 'receiver_id'
  has_many :senders, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :tabs
  has_many :comments
  has_many :ratings
  has_many :user_discussions
  has_many :discussions, :through => :user_discussions
  has_many :profile_pictures
  has_many :shared_tabs,:dependent => :destroy
  has_many :groups, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  has_many :photo_comment, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  SYSTEM_ROLE_ADMIN_USER = 90
  SYSTEM_ROLE_USER = 10
  SECURITY_KEY = 'mmm, salty passwords'

  #ajaxful_rater

  validates_uniqueness_of :username, :message => "Username has already been taken."
  validates_presence_of :username, :message => "Username can't be blank."
  validates_length_of :username, :maximum => 50, :message => "Username should not exceed 50 characters."
  validates :encrypted_password, :presence => {:message => 'Password cannot be blank.'}
  validates_uniqueness_of :email, :message => 'Email has already been taken.'
  validates_presence_of :email, :message => "Email can't be blank."
  validates_length_of :email, :maximum => 100, :message => "Email should not exceed 100 characters."

  before_create :make_confirmation_token
  after_validation :set_hash_password

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used when user click on the activation link to change the status of user from 'pending' to 'active'
  def activate
    self.confirmation_token = nil
    self.account_status = 'active'
    save(:validate => false)
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used when user is created to create confirmation_token for the activation link
  def make_confirmation_token
    self.confirmation_token = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    self.account_status = 'pending' if self.system_role != SYSTEM_ROLE_ADMIN_USER
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to encrypt the password after validation
  def set_hash_password
    # update password if password was set
    self.encrypted_password = User.hash_password(encrypted_password)  if !encrypted_password.blank? && encrypted_password.length < 32
    #filtered_errors = self.errors.reject{ |err| %w{ user_detail }.include?(err.first) }
    #self.errors.clear
    #filtered_errors.each { |err| self.errors.add(*err) }
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is return user if username and password is correct during login and is active
  def self.authenticate(username, pass)
    user = User.where("username = ? AND encrypted_password = ? AND account_status = ?", username, User.hash_password(pass), 'active').first
    return user
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to find all the message of the Inbox for User
  def inbox_messages
    self.receivers.where("deleted_by_receiver = ? OR deleted_by_receiver is ?", false, nil).order("created_at DESC")
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to find all the message of the Sent Messages for User
  def sent_messages
    self.senders.where("deleted_by_sender = ? OR deleted_by_sender is ?", false, nil).order("created_at DESC")
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method return true/false depending on user active or not
  def is_active?
    !!(self.account_status == 'active')
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method return true/false depending on user admin or user
  def is_admin?
    !!(self.system_role == SYSTEM_ROLE_ADMIN_USER)
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 06/01/2012
  #Purpose:
  #++ This method return true/false depending on user user or admin
  def is_user?
    !!(self.system_role == SYSTEM_ROLE_USER)
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 07/01/2012
  #Purpose:
  #++ Find all the users available for the login user to whom he can send message
  def all_message_users(search_text)
    User.where("id !=? AND account_status = ? AND system_role != ? AND username LIKE ?", self.id, 'active', SYSTEM_ROLE_ADMIN_USER, "%#{search_text}%")
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 07/01/2012
  #Purpose:
  #++ Find all the users to who either follows login user or followed by login user
  def from_follower_following(search_text)
    following_array = self.followers.collect{|f| f.follower_id}
    follower_array = self.followings.collect{|f| f.following_id}
    id_array = following_array + follower_array
    User.where("id in (?) AND account_status = ? AND system_role != ? AND username LIKE ?", id_array, 'active', SYSTEM_ROLE_ADMIN_USER, "%#{search_text}%")
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 09/01/2012
  #Purpose:
  #++ This method is used to find the people using different parameteres
  def search_query(option)
    #TO DO:- Remaining Search on the basis of TAG
    where_clause=""
    where_array=[]
    where_clause+=" AND u.system_role!= #{SYSTEM_ROLE_ADMIN_USER}"
    where_clause+=" AND u.username like ?" if option['username'].present?
    where_array << "%#{option['username']}%" if option['username'].present?
    where_clause+=" AND ud.work_info like ?" if option['work_info'].present?
    where_array << "%#{option['work_info']}%" if option['work_info'].present?
    where_clause+=" AND ud.education like ?" if option['education'].present?
    where_array << "%#{option['education']}%" if option['education'].present?
    where_clause+=" AND ud.interest_internet like ?" if option['interest_internet'].present?
    where_array << "%#{option['interest_internet']}%" if option['interest_internet'].present?
    where_clause+=" AND ud.about_me like ?" if option['about_me'].present?
    where_array << "%#{option['about_me']}%" if option['about_me'].present?
    where_clause+=" AND ud.sex = '#{option['sex']}'" if option['sex'].present?
    where_clause+=" AND (ud.age >= #{option['age_from'].to_i} AND ud.age <= #{option['age_to'].to_i})" if option['age_from'].present? && option['age_to'].present?
    users = User.find_by_sql(["SELECT u.* FROM (users u LEFT JOIN user_details ud ON u.id = ud.user_id)
			      WHERE u.id != #{self.id} #{where_clause} ORDER BY u.username", *where_array ])

    if option['tab'].present? && users.present?
      user_id = users.collect{|u| u.id }
      users =User.find_by_sql(["SELECT u.* FROM (users u LEFT JOIN tabs t ON t.user_id=u.id
                          LEFT JOIN tab_sites ts ON ts.tab_id=t.id
                          LEFT JOIN shared_tabs s_t ON t.id=s_t.shareable_id AND 'Tab'=s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id
                          LEFT JOIN group_users g_u ON g_u.group_id=g.id
                          LEFT JOIN user_discussions ud ON u.id = ud.user_id
                          LEFT JOIN discussions d ON ud.discussion_id = d.id
                          )
                          WHERE t.user_id in (?) AND (ts.site_url like ? OR t.name like ? OR d.url like ?)
                          AND ((t.share_type=2 AND g_u.user_id= ?) OR (t.share_type = ?))",
                          user_id,"%#{option['tab']}%","%#{option['tab']}%","%#{option['tab']}%", self.id, 0])
    end
    users.uniq!
    users
  end


  #--
  #Created by: Salil Gaikwad
  #Created on: 07/01/2012
  #Purpose:
  #++ This method to find a discussion url.
  def add_discussion?(discussion)
    return nil if self.discussions.where("url = ?", discussion[:url]).present?
    disc = Discussion.find_by_url(discussion[:url])
    if disc.present?
      discuss = UserDiscussion.new(:user_id => self.id, :discussion_id => disc.id )
    else
      discuss = Discussion.new(discussion)
      user_discussion = discuss.user_discussions.build
      user_discussion.user_id = self.id
    end
    discuss.save
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 23/01/2012
  #Purpose:
  #++ This method is used to find a discussion is discussed by user or not
  def is_discussed?(discussion_id)
    UserDiscussion.exists?(:discussion_id => discussion_id, :user_id => self.id)
  end


  #--
  #Created by: Salil Gaikwad
  #Created on: 10/01/2012
  #Purpose:
  #++ This method is use to show thumbnail for different size
  def profile_pic(thumb)
    return "/images/profile_image.jpg" unless self.profile_pictures.present?
    file = self.profile_pictures.last.photo(thumb)
    File.exist?("#{RAILS_ROOT}/public/#{file}") ? file : "/images/profile_image.jpg"
  end
  #--
  #Created by: Salil Gaikwad
  #Created on: 10/01/2012
  #Purpose:
  #++ This method is required for the acts_as_rateable gem
  def login
    self.username
  end

  #--
  #Created by: Satish Zol
  #Created on: 12/01/2012
  #Purpose:
  #++ This method is use to show feeds for login user for last one month
  def feed(from, to)
    #from, to = (Time.now-30.day), Time.now
    followers, followings = self.followers.collect{ |f| f.follower_id }, self.followings.collect{ |f| f.following_id }
    followers_followings = followers+followings
    ff = FollowerFollowing.where('follower_id in (?) AND created_at>=? and created_at<=?', followers_followings, from, to).order('created_at desc')
    tab_sites = tab_sites = TabSite.find_by_sql(["SELECT ts.* FROM (tab_sites ts LEFT JOIN tabs t ON ts.tab_id=t.id
                          LEFT JOIN shared_tabs s_t ON t.id=s_t.shareable_id AND 'Tab'=s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id LEFT JOIN group_users g_u ON g_u.group_id=g.id)
                          WHERE (t.user_id in (?) AND ((t.share_type=2 AND g_u.user_id= ?) OR (t.share_type = ?))) AND ts.created_at>=? and ts.created_at<=? ORDER BY t.created_at DESC ",
                          followers_followings, self.id, 0, from, to])
    ## added by Jalendra for shared tabs feeds
    shared_tabs = Tab.find_by_sql(["SELECT t.* FROM (tabs t LEFT JOIN shared_tabs s_t ON t.id=s_t.shareable_id AND 'Tab'=s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id LEFT JOIN group_users g_u ON g_u.group_id=g.id)
                          WHERE (t.user_id in (?) AND ((t.share_type=2 AND g_u.user_id= ?) OR (t.share_type = ?))) AND t.created_at>=? and t.created_at<=?  ORDER BY t.created_at DESC ",
                          followers_followings, self.id, 0, from, to])

    ## added by Jalendra for shared tabs feeds
    shared_pics = Picture.find_by_sql(["SELECT p.* FROM (pictures p LEFT JOIN shared_tabs s_t ON p.id=s_t.shareable_id AND 'Picture'=s_t.shareable_type
                          LEFT JOIN albums a ON a.id=p.album_id
                          LEFT JOIN groups g ON g.id=s_t.group_id
                          LEFT JOIN group_users g_u ON g_u.group_id=g.id)
                          WHERE (a.user_id in (?) AND ((p.share_type=2 AND g_u.user_id= ?) OR (p.share_type = ?))) AND p.created_at>=? and p.created_at<=? ORDER BY p.created_at DESC",
                          followers_followings, self.id, 0, from, to])
                      
    ######
    comments = Comment.where('user_id in (?) AND created_at>=? and created_at<=?', followers_followings, from, to).order('created_at desc')
    user_discussions = UserDiscussion.find_by_sql(["SELECT ud.* FROM user_discussions ud LEFT JOIN discussions d on ud.discussion_id = d.id WHERE ud.user_id in (?) AND ud.created_at>=? and ud.created_at<=?", followers_followings, from, to])
    ## added by jalendra
    ## to sort the feeds
    feeds = Array.new
    feeds = (ff + tab_sites + comments + user_discussions + shared_tabs + shared_pics).sort { |a,b|
      if a.updated_at && b.updated_at
        response = 0
        if a.updated_at > b.updated_at then response = -1 end
        if b.updated_at > a.updated_at then response = 1 end
        response
      end
    }
    feeds
    #[ff, tab_sites, comments, user_discussions, shared_tabs, shared_pics]
  end


  #--
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #Purpose:
  #++ This method is used is return true/false depending on whether user able to rate or not given disucssion/comment
  def is_rater?(rating_for)
    return false if self.is_admin?
    user_section = rating_for.class == Comment ? (rating_for.user_id == self.id) : (rating_for.user_ids.include?(self.id))
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #Purpose:
  #++ This method is used is to return true/false depending on whether user follows param users or not
  def is_following?(user_id)
    self.followings.where("following_id = ?", user_id).present?
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #Purpose:
  #++ This method is used is to return true/false depending on whether param user follows users or not
  def is_follower?(user_id)
    self.followers.where("follower_id= ?", user_id).present?
  end

  #--
  #Created by: Satish Zol
  #Created on: 23/01/2012
  #Purpose:
  #++ This method is used is to return true/false depending on whether param user follows users or not
  def is_email_update?(user_id)
    self.followings.where("following_id = ? AND get_email_updates = true", user_id).present?
  end

  #--
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #Purpose:
  #++ This method is used is to return the path of the user's profile
  def profile_path
    "/users/profile/#{self.id}"
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 31/01/2012
  #Purpose:
  #++ This method is used is to return the default group of user
  def default_group
    self.groups.where("name=?","Default")
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 31/01/2012
  #Purpose:
  #++ This method is used is to check user belongs to any group other than Default
  def belongs_to_group(u_id)
    GroupUser.find_by_sql(["SELECT g.* FROM (group_users gu LEFT JOIN groups g ON g.id=gu.group_id) WHERE (g.user_id=#{self.id} AND gu.user_id=#{u_id}) AND g.name!='Default'"])
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 31/01/2012
  #Purpose:
  #++ This method is used is to check user belongs to any group
  def all_groups_having(u_id)
    GroupUser.find_by_sql(["SELECT g.* FROM (group_users gu LEFT JOIN groups g ON g.id=gu.group_id) WHERE (g.user_id=#{self.id} AND gu.user_id=#{u_id})"])
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 01/02/2012
  #Purpose:
  #++ This method is used is to get all tabs that are shared with user
  def shared_tabs_with(u_id)
    if self.id != u_id
      Tab.find_by_sql(["SELECT t.* FROM (tabs t LEFT JOIN shared_tabs s_t ON t.id=s_t.shareable_id AND 'Tab'=s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id LEFT JOIN group_users g_u ON g_u.group_id=g.id)
                          WHERE t.user_id= ? AND ((t.share_type=2 AND g_u.user_id= ?) OR (t.share_type = ?)) ORDER BY t.created_at DESC ",
                          u_id, self.id, 0])
    else
      Tab.find(:all,:conditions=>['user_id=? ', u_id], :order=>'created_at DESC')
    end
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 01/02/2012
  #Purpose:
  #++ This method is used to ge all groups with which tab is shared
  def groups_having_shared(t_id)
    Group.find_by_sql(["SELECT g.* FROM (tabs t LEFT JOIN shared_tabs s_t ON t.id=s_t.shareable_id AND 'Tab'=s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id)
                          WHERE t.id=? AND t.user_id=?",t_id,self.id
                          ])
  end

  #--
  #Created by: Satish Zol
  #Created on: 14/02/2012
  #Purpose:
  #++ This method is used to ge all groups with which tab is shared
  def groups_having_album_shared(a_id)
    Group.find_by_sql(["SELECT g.* FROM (albums a LEFT JOIN shared_tabs s_t ON a.id = s_t.shareable_id AND 'Album' = s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id)
                          WHERE a.id=? AND a.user_id=?", a_id, self.id
                          ])
  end

  #--
  #Created by: Satish Zol
  #Created on: 16/02/2012
  #Purpose:
  #++ This method is used to ge all groups with which tab is shared
  def groups_having_photo_shared(p_id)
    Group.find_by_sql(["SELECT g.* FROM (pictures p LEFT JOIN shared_tabs s_t ON p.id = s_t.shareable_id AND 'Picture' = s_t.shareable_type
                          LEFT JOIN groups g ON g.id=s_t.group_id)
                          WHERE p.id=?", p_id
                          ])
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 16/02/2012
  #Purpose:
  #++ This method is used to get all pictures that should be visible to user
  def all_visible_pictures(page)
   per_page = 20
   off = (page-1)*per_page

   pictures =  Picture.find_by_sql(["SELECT distinct p.* from (pictures p LEFT JOIN shared_tabs s_t ON p.id = s_t.shareable_id AND 'Picture' = s_t.shareable_type
                           LEFT JOIN albums a ON a.id=p.album_id
                           LEFT JOIN groups g ON g.id=s_t.group_id
                           LEFT JOIN group_users gu ON g.id=gu.group_id)
                           WHERE ( p.share_type=0 OR a.user_id=? OR (p.share_type=2 AND gu.user_id=?) OR (p.share_type=1 AND a.user_id=?)) AND a.id is not null ORDER BY p.created_at DESC LIMIT ? OFFSET ?
                          ",self.id,self.id,self.id,per_page, off])
    pictures.uniq!
    pictures
  end

  #--
  #Created by: Satish Zol
  #Created on: 16/02/2012
  #Purpose:
  #++ This method is used to View all pictures that should be shared in group and in public
  def shared_albums(u_id)
   return Album.find(:all, :conditions => ['user_id=?', u_id])if self.id == u_id
    album = Album.find_by_sql(["SELECT a.* from(albums a LEFT JOIN shared_tabs s_t ON a.id = s_t.shareable_id AND 'Album' = s_t.shareable_type
                           LEFT JOIN groups g ON g.id=s_t.group_id
                           LEFT JOIN group_users gu ON g.id=gu.group_id)
                           WHERE (a.user_id=?) AND (a.share_type=0 OR (a.share_type=2 AND gu.user_id=?))", self.id, u_id])

    album.uniq!
    album
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 22/02/2012
  #Purpose:
  #++ This method is used to View all pictures that should be shared in group and in public
  def commented_discussions(page=1)
    per_page = 5
    off = (page-1)*per_page
    Discussion.find_by_sql(["SELECT DISTINCT d.* from(comments c LEFT JOIN discussions d ON d.id=c.discussion_id)
                            WHERE c.user_id=? ORDER BY c.updated_at DESC LIMIT ? OFFSET ?",self.id, per_page, off])
  end


  

  private
  def self.hash_password(p)
    Digest::SHA1.hexdigest("#{p}#{SECURITY_KEY}")
  end
end
