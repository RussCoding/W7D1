# create_table :users do |t|
#     t.string :username, null: false 
#     t.string :password_digest, null: false

#     t.timestamps 
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true 
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
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
    #self.password_digest.is_password?(password)
  end

end