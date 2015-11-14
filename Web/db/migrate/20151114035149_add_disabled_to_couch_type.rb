class AddDisabledToCouchType < ActiveRecord::Migration
  def change
    add_column :couch_types, :disabled, :boolean
  end
end
