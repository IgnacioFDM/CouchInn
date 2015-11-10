class CouchType < ActiveRecord::Base
  # esto para cuando santi cree el modelo Couch
   has_many :couch_posts
  validates_presence_of :name
  validates_uniqueness_of :name
end
