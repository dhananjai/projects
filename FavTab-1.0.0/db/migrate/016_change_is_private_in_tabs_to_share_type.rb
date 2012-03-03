class ChangeIsPrivateInTabsToShareType < ActiveRecord::Migration
  def self.up
    remove_column :tabs, :is_private
    add_column :tabs, :share_type, :integer
  end

  def self.down
    add_column :tabs, :is_private, :boolean
    remove_column :tabs, :share_type
  end
end
