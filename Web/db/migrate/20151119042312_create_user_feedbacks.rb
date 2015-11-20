class CreateUserFeedbacks < ActiveRecord::Migration
  def change
    create_table :user_feedbacks do |t|
      t.integer :user_id
      t.text :comment
      t.integer :rating

      t.timestamps null: false
    end
  end
end
