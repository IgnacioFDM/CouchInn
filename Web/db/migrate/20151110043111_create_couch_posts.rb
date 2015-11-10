class CreateCouchPosts < ActiveRecord::Migration
  def change
    create_table :couch_posts do |t|
      t.string :title
      t.text :description
      t.string :has_one
      t.integer :couch_type_id

      t.timestamps null: false
    end
  end
end
