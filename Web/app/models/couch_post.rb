class CouchPost < ActiveRecord::Base
  ratyrate_rateable "rating"
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

  def is_owner?(user)
    return self.user_id = user.id
  end
  

  def is_free?(from, to)
    reservas_del_couch = self.couch_reservation_requests
    reservas_confirmadas = reservas_del_couch.confirmed
    
    return reservas_confirmadas.where('end_date >= ? AND start_date <= ?', from,to).empty?
  end
  

  def self.free_couches(from, to)
    result = [] 
    Couch.all.each do |couch|
      result << couch if couch.is_free?(from, to)
    end
  end
end
