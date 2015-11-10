class ChangeCouchPostVacantToVacants < ActiveRecord::Migration
  def change
  	remove_column :couch_posts , :vacant
  	add_column :couch_posts , :vacants , :integer 
  end
end
