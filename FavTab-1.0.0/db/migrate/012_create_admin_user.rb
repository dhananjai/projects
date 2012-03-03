class CreateAdminUser < ActiveRecord::Migration
  def self.up
    sql = ActiveRecord::Base.connection
    sql.execute("INSERT INTO users (username, email, encrypted_password, system_role, confirmation_token, account_status) VALUES
		('admin123', 'demo@cipher-tech.com', '716316a215feb1227d2cc0ffb125e16bf6306e9a', #{User::SYSTEM_ROLE_ADMIN_USER}, 'null', 'active')")
    # PLEASE DON'T EDIT THIS LINE "716316a215feb1227d2cc0ffb125e16bf6306e9a" is Hashed Password for the "admin123"
    user = User.find_by_username('admin123')
    sql.execute("INSERT INTO user_details (user_id) VALUES (#{user.id})")
  end

  def self.down
    user = User.find_by_username('demo@cipher-tech.com')
    UserDetail.find_by_user_id(user.id).delete if user
    User.delete_all("username = 'demo@cipher-tech.com'")
  end
end
