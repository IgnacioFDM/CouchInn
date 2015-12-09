class AddRatingToUserFeedback < ActiveRecord::Migration
  def change
    add_column :user_feedbacks, :rating, :integer
  end
end
