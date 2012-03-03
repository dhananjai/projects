class CreateSharedTabs < ActiveRecord::Migration
  def self.up
    create_table :shared_tabs do |t|
      t.integer :shareable_id
      t.integer :group_id
      t.string  :shareable_type,:limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :shared_tabs
  end
end
