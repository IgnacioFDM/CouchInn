class CouchType < ActiveRecord::Base
  # esto para cuando santi cree el modelo Couch
  # belongs_to :couch
  validates_presence_of :name
  validates_uniqueness_of :name
end
