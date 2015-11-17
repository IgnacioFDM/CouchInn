class RemoveUserNameFromCouchPosts < ActiveRecord::Migration
  def change
    remove_column :couch_posts, :username, :string
  end
end
