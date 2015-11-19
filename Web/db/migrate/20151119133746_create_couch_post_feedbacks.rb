class CreateCouchPostFeedbacks < ActiveRecord::Migration
  def change
    create_table :couch_post_feedbacks do |t|
      t.integer :owner_id
      t.text :comment
      t.integer :score
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
