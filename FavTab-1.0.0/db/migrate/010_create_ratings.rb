class CreateRatings < ActiveRecord::Migration

=begin
  def self.up
    create_table :ratings do |t|
      t.integer :rate
      t.integer :user_id
      t.integer :rateable_id
      t.string :rateable_type, :limit => 20
      t.timestamps
    end
  end
=end
    #Added for acts_as_rateable
  def self.up
    create_table :rates do |t|
      t.column :score, :integer
    end

    create_table :ratings do |t|
      t.column :user_id, :integer
      t.column :rate_id, :integer
      t.column :rateable_id, :integer
      t.column :rateable_type, :string, :limit => 32
      t.column :free_text, :text
      t.column :rater_name, :string
      t.timestamps
    end

    add_index :ratings, :rate_id
    add_index :ratings, [:rateable_id, :rateable_type]
  end

  def self.down
    drop_table :ratings
    drop_table :rates #Added for acts_as_rateable
  end
end
