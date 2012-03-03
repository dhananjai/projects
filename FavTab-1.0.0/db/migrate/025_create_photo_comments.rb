class CreatePhotoComments < ActiveRecord::Migration
  def self.up
    create_table :photo_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :parent_id
      t.integer :discussable_id
      t.string :discussable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :photo_comments
  end
end
