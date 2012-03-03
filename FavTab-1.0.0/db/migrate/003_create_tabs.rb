class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.integer :user_id
      t.string :name, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :tabs
  end
end
