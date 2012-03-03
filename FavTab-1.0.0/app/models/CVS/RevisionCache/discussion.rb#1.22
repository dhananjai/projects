class Discussion < ActiveRecord::Base
  require 'mechanize'
  acts_as_rateable
  has_many :user_discussions, :dependent => :destroy
  has_many :users, :through => :user_discussions
  has_many :ratings, :as => :rateable, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates_associated :user_discussions
  #ajaxful_rateable :stars => 10
  before_save :add_title
  
  validates :url,
    :presence => {:message => "can't be blank."},
    :length => {:maximum => 300},
    :format => {:with =>/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 12/01/2012
  #Purpose: 
  #++ This method is used find the most popular discussions having comments between given period of time
  def self.most_popular(from, to,page=1, order_by_rating=false)
    per_page = 10
    off = (page-1)*per_page
    select = order_by_rating ? "(SUM(r.score)/COUNT(ra.id)) AS avg," : ""
    join=order_by_rating ? "LEFT JOIN ratings ra on d.id = ra.rateable_id AND 'Discussion' = ra.rateable_type LEFT JOIN rates r on ra.rate_id = r.id" : ""
    order = order_by_rating ? "avg" : "count"
    discussions = Discussion.find_by_sql(["SELECT #{select} COUNT(c.id) AS count, d.*
			      FROM discussions d LEFT JOIN comments c on d.id = c.discussion_id #{join}
	                      WHERE d.updated_at>=? and d.updated_at<=? GROUP BY d.id ORDER BY #{order} DESC LIMIT ? OFFSET ?", from, to,per_page, off])

  end
  
  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #++ This method is used find the total votes for the discussion
  def votes
    self.ratings.length
  end

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #++ This method is used find the array of the users ids for the discussion
  def user_ids
    self.users.collect{|ud| ud.id}
  end

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 23/01/2012
  #++ This method is used show the title of a site if present otherwise showing url itself
  def site_title
    self.title ? self.title : self.url
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 22/02/2012
  #Purpose: to get all picture raters
  #++
  def raters
    users = User.find_by_sql(["SELECT distinct u.* FROM (ratings r LEFT JOIN users u ON r.user_id=u.id)
                          WHERE r.rateable_id=? and r.rateable_type=?",self.id,"Discussion" ])
  end

  
  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 24/01/2012
  #++ This method is used to add the title of a site to site url
  def add_title
    begin
      self.title = Mechanize.new.get(self.url).title
    rescue => e
    end
  end

end
