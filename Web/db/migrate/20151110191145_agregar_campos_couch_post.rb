class AgregarCamposCouchPost < ActiveRecord::Migration
  def change
  	add_column :couch_posts , :baja , :boolean
  	remove_column :couch_posts , :couch_type_id
  	add_column :couch_posts , :username , :string 
  	add_column :couch_posts , :couch_type_id , :integer 
  	remove_column :couch_posts , :has_one

  end
end
