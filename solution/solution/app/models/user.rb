# create_table :users do |t|
#     t.string :username, null: false 
#     t.string :password_digest, null: false

#     t.timestamps 
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true 
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :password_digest, presence: true 
  after_initialize :session_token
  attr_reader :password
  def reset_session_token!
    self.update!(self.session_token = SecureRandom::urlsafe_base64)
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    object = BCrypt::Password.new(self.password_digest)
    object.is_password?(password)
  end

  def find_by_credentials(username, password)
    user = User.find_by({username: username}
      if self.is_password?(password)
        return user
      end
     puts "User doesn't exist."
      nil 
    end



end