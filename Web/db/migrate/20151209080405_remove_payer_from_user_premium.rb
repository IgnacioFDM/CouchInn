class RemovePayerFromUserPremium < ActiveRecord::Migration
  def change
      remove_column :user_premia, :payer, :belongs_to
      add_column :user_premia, :user_id, :integer
      add_column :user_premia, :coupon_id, :integer
  end
end
