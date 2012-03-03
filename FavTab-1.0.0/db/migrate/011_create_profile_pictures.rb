class CreateProfilePictures < ActiveRecord::Migration
  def self.up
    create_table :profile_pictures do |t|
      t.integer :user_id
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :profile_pictures
  end
end
