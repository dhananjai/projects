class CreateTabSites < ActiveRecord::Migration
  def self.up
    create_table :tab_sites do |t|
      t.integer :tab_id
      t.string :site_url, :limit => 1024

      t.timestamps
    end
  end

  def self.down
    drop_table :tab_sites
  end
end
