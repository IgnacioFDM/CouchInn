class Change < ActiveRecord::Migration
  def change
  	  	remove_column :couch_post_feedbacks , :owner_id
  	add_column :couch_post_feedbacks , :user_id , :integer 

  	  	remove_column :couch_post_feedbacks , :target_id
  	add_column :couch_post_feedbacks , :couch_post_id , :integer 
  end
end
