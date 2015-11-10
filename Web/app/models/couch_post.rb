class CouchPost < ActiveRecord::Base
	belongs_to :couch_type
	#belongs_to :username
	  # revisar cuando se puedan agregar usuarios a la semilla
	  validates_presence_of :title
	  validates_presence_of :description
	  validates_presence_of :rooms
	  validates_presence_of :vacants
	  validates_presence_of :zone
	  validates_presence_of :couch_type_id
	  # validates_presence_of :username 
	  # revisar cuando se puedan agregar usuarios a la semilla
#  validates_uniqueness_of :name
end
