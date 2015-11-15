class CouchReservationRequest < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :couch_post_id
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :amount
  validate :response
  belongs_to :user
  belongs_to :couch_post

  private
  def response
    if self.responded_at.nil? != self.accepted.nil?
      errors.add :base,'pedido inválido.'
    end
  end
end
