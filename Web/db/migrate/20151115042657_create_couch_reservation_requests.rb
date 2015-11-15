class CreateCouchReservationRequests < ActiveRecord::Migration
  def change
    create_table :couch_reservation_requests do |t|
      t.integer :user_id
      t.integer :couch_post_id
      t.datetime :responded_at
      t.boolean :accepted
      t.date :start_date
      t.date :end_date
      t.integer :amount

      t.timestamps null: false
    end
  end
end
