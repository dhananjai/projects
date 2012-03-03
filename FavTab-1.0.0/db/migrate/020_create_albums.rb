class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name, :limit => 50
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
