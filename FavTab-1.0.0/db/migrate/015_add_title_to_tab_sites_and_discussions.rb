class AddTitleToTabSitesAndDiscussions < ActiveRecord::Migration
  def self.up
    add_column :tab_sites, :title, :string
    add_column :discussions, :title, :string
  end

  def self.down
    remove_column :tab_sites, :title
    remove_column :discussions, :title
  end
end
