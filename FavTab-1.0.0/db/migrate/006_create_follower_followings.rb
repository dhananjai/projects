class CreateFollowerFollowings < ActiveRecord::Migration
  def self.up
    create_table :follower_followings do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
  end

  def self.down
    drop_table :follower_followings
  end
end
