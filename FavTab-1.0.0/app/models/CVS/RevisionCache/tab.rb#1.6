class Tab < ActiveRecord::Base
  belongs_to :user
  has_many :tab_sites, :dependent => :destroy
  has_many :shared_tabs, :as => :shareable, :dependent => :destroy
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 50

  #Created by: Deepali Thaokar
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to collect all urls for a tab
  def sites
    urls= self.tab_sites.collect{|site| site.site_url}
    urls.present? ? urls.join(" ") : ""
  end

  #Method to split a bulk sites
  #Created by: Deepali Thaokar
  #Created on: 06/01/2012
  #Purpose:
  #++ This method is used to split a bulk sites
  def add_bulk_sites(sites)
    tab_sites = sites.split("\n")
    for tab_site in tab_sites
      TabSite.create(:tab_id =>self.id, :site_url => tab_site.gsub("\r", ""))
    end
  end

end
