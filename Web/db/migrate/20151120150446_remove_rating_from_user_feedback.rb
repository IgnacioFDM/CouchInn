class RemoveRatingFromUserFeedback < ActiveRecord::Migration
  def change
    remove_column :user_feedbacks, :rating, :integer
  end
end
