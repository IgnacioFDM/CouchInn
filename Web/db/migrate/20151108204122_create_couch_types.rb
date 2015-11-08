class CreateCouchTypes < ActiveRecord::Migration
  def change
    create_table :couch_types do |t|
      t.string :name
      
      t.timestamps null: false
    end
  end
end
