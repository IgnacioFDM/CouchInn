class CouchType < ActiveRecord::Base
  # esto para cuando santi cree el modelo Couch
   has_many :couch_posts , dependent: :restrict_with_exception
  validates_presence_of :name 
  validates_uniqueness_of :name
end
