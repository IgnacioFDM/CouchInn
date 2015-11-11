class AddPictureAttachmentToCouchPost < ActiveRecord::Migration
  def up
  	add_attachment :couch_posts, :mainpic
  end
end
