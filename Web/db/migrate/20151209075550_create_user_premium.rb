class CreateUserPremium < ActiveRecord::Migration
  def change
    create_table :user_premia do |t|
      t.belongs_to :buyer
      t.boolean :paid
      t.timestamp :paidtime
      t.timestamps
    end
  end
end
