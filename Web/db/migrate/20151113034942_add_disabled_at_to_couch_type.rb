class AddDisabledAtToCouchType < ActiveRecord::Migration
  def change
  	add_column :couch_types, :disabled_at, :datetime
  end
end
