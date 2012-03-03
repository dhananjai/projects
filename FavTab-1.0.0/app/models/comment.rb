class Comment < ActiveRecord::Base
  acts_as_rateable
  belongs_to :user
  belongs_to :discussion
  has_many :ratings, :as => :rateable, :dependent => :destroy
  acts_as_tree :order => "comment"

  validates :comment,
    :presence => {:message => "can't be blank."},
    :length => {:maximum => 1000}

  after_save :update_discussion

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 13/01/2012
  #++ This method is used find the total votes for the discussion
  def votes
    self.ratings.length
  end

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 24/01/2012
  #++ This method is used to update the discussion updated_at whenever any comment is occur
  def update_discussion
    self.discussion.update_attribute(:updated_at, Time.now) if self.discussion
  end

end
