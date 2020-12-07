# create_table :users do |t|
#     t.string :username, null: false 
#     t.string :password_digest, null: false

#     t.timestamps
class User < ApplicationRecord
 validates :username, presence: true, uniqueness: true 
 validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  
   after_initialize :session_token

   def reset_session_token!

   end


end