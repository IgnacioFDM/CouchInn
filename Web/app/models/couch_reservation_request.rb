class CouchReservationRequest < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :couch_post_id
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :amount
  validate :state
  validate :date_difference
  validate :date
  belongs_to :user
  belongs_to :couch_post

  private
  def state
    if self.responded_at.nil? != self.accepted.nil?
      errors.add :base, 'Pedido inválido. accepted no nulo ssi. responded_at no nulo'
    end
  end
  def date_difference
    if self.end_date < self.start_date 
      errors.add :base, 'Fecha de salida no puede ser anterior a la fecha de entrada.'
    end
  end
  def date
    if self.start_date.past?
      errors.add :base, 'Fecha de entrada no puede ser anterior ni hoy.'
    end
  end
end
