class CouchPost < ActiveRecord::Base
  belongs_to :couch_type
  belongs_to :user
  has_many :couch_reservation_requests
  has_many :couch_post_feedbacks

  has_attached_file :mainpic, styles: { frontpage: "320x150#", couchlist: "300x240#", bigpanoramic: "800x300#"}, default_url: "images/:style/missing.png"
  validates_presence_of :couch_type
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :rooms
  validates_presence_of :vacants
  validates_presence_of :zone
  validates_attachment_content_type :mainpic, :content_type =>["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
