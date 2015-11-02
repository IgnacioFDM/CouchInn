class CreateCouchTypes < ActiveRecord::Migration
  def change
    create_table :couch_types do |t|
      t.string :name
    end
  end
end
