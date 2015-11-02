class CouchType < ActiveRecord::Base
  # esto para cuando santi cree el modelo Couch
  # belongs_to :couch
  validates :name, presence: true
end