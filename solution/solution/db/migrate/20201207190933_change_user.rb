class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :session_token, :string, null: false, unique: true
    add_index :users, :session_token
  end
end
