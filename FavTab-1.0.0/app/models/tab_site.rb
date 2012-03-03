class TabSite < ActiveRecord::Base
  require 'mechanize'
  belongs_to :tab
  validates :site_url,  
            :presence => {:message => "can't be blank."},
            :length => {:maximum => 300},
            :format => {:with =>/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }

  validate :tab_site_count
  before_save :add_title

  def tab_site_count
    site = TabSite.count(:conditions=>['tab_id=?', self.tab_id])
    self.errors.add :base, 'Only 100 sites can be create under one tab.' if !site.blank? && site.to_i >= 100
  end

  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 23/01/2012
  #++ This method is used show the title of a site if present otherwise showing url itself
  def site_title
    self.title ? self.title : self.site_url
  end

  #--
  #Created by: Jalendra Bhanarkar
  #Created on: 24/01/2012
  #++ This method is used to add the title of a site to site url
  def add_title
    begin
      self.title = Mechanize.new.get(self.site_url).title
    rescue => e
    end
  end

end
