class Group < ActiveRecord::Base
  has_many :group_users, :dependent => :destroy
  has_many :shared_tabs, :dependent => :destroy
  belongs_to :user
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  validates_length_of :name, :maximum => 50
  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 31/01/2012
  #Purpose:
  #++ This method is used is to check if the group is default
  def is_default_group?
    self.name=="Default"
  end
end
