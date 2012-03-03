class AddGetEmailUpdatesToFollowerFollowings < ActiveRecord::Migration
  def self.up
    add_column :follower_followings, :get_email_updates, :boolean
  end

  def self.down
    remove_column :follower_followings, :get_email_updates
  end
end
