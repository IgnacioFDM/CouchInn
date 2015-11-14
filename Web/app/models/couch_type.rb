class CouchType < ActiveRecord::Base
  before_validation :downcase_name
  has_many :couch_posts , dependent: :restrict_with_exception
  validates_presence_of :name 
  validates_uniqueness_of :name

  def is_disabled?
  	not self.disabled_at.blank?
  end

  private
  def downcase_name
  	self.name = self.name.downcase
  end
end
