class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      #t.database_authenticatable :null => false
      #t.recoverable
      #t.rememberable
      #t.trackable
      t.string :username, :limit => 50
      t.string :account_status, :limit => 20
      t.integer :system_role
      t.string :encrypted_password
      t.string :confirmation_token
      t.string :email, :limit => 255
      # t.encryptable
      #t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      t.timestamps
    end
    #add_index :users, :username #,                :unique => true
    #add_index :users, :email #,                :unique => true
    #add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
