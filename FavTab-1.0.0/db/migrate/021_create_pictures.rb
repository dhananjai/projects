class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :photo_detail
      t.text :site_name
      t.integer :share_type
      t.integer :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
