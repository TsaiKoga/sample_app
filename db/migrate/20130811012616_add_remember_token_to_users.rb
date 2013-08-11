class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
		add_column :users, :remember_token, :string
		add_index :users, :remember_token			# 增加索引，快
  end
end
