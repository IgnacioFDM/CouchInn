class AddAuthorToUserFeedback < ActiveRecord::Migration
  def change
    add_column :user_feedbacks, :author_id, :integer
  end
end
