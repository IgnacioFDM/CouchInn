class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :telephone, :string
    add_column :users, :birthdate, :date
  end
end
