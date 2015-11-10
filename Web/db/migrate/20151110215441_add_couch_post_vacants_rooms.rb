class AddCouchPostVacantsRooms < ActiveRecord::Migration
  def change
  	add_column :couch_posts , :rooms , :integer
  	add_column :couch_posts , :vacant , :integer
  end
end
