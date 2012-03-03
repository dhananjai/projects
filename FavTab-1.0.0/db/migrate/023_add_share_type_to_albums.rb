class AddShareTypeToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :share_type, :integer, :null => false

  end

  def self.down
    remove_column :albums, :share_type
  end
end
