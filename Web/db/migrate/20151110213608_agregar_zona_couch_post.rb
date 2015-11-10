class AgregarZonaCouchPost < ActiveRecord::Migration
  def change
  	add_column :couch_posts , :zone , :string 
  end
end
