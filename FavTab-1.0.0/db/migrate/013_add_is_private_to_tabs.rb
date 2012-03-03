class AddIsPrivateToTabs < ActiveRecord::Migration
  def self.up
    add_column :tabs, :is_private, :boolean
  end

  def self.down
    remove_column :tabs, :is_private
  end
end
