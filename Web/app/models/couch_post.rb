class CouchPost < ActiveRecord::Base
    belongs_to :couch_type
    has_attached_file :mainpic, styles: { frontpage: "320x150#", couchlist: "300x240#", bigpanoramic: "800x300#"}, default_url: "images/:style/missing.png"
    #belongs_to :username
    # revisar cuando se puedan agregar usuarios a la semilla
    validates_presence_of :title
    validates_presence_of :description
    validates_presence_of :rooms
    validates_presence_of :vacants
    validates_presence_of :zone
    validates_presence_of :couch_type_id
    validates_attachment_content_type :mainpic, :content_type =>["image/jpg", "image/jpeg", "image/png", "image/gif"]
    # validates_presence_of :username 
    # revisar cuando se puedan agregar usuarios a la semilla
    #  validates_uniqueness_of :name
end
