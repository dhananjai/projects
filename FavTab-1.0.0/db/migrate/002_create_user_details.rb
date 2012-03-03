class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.text :work_info
      t.text :education
      t.integer :age
      t.string :sex, :limit => 10
      t.text :interest_internet
      t.text :about_me
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_details
  end
end
