class AddUserIdToCouchPosts < ActiveRecord::Migration
  def change
    add_column :couch_posts, :user_id, :integer
  end
end
