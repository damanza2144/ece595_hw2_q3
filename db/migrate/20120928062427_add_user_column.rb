class AddUserColumn < ActiveRecord::Migration
  def up
	
	add_column :posts, :user_id, :integer
	add_column :comments, :user_id, :integer
	
  end

  def down
	
	remove_column :posts, :user_id, :integer
	remove_column :comments, :user_id, :integer
	
  end
end
