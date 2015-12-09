class AddExpiryToUsers < ActiveRecord::Migration
  def change
	add_column :users, :premium_expiration, :date
  end
end
