class CouchReservationRequest < ActiveRecord::Base
  default_scope -> { order("start_date desc") }
  validates_presence_of :user_id
  validates_presence_of :couch_post_id
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :amount
  validate :amount_is_right
  validate :state
  validate :date_difference
  validate :date
  validate :owner
  validate :doesnt_overlap_own
  validate :availability
  belongs_to :user
  belongs_to :couch_post

  def self.requests_made_by_user(user_id)
    return User.find(user_id).couch_reservation_requests
  end

  def self.requests_made_to_user(user_id)
    return self.joins(:couch_post).where(:couch_posts => {:user_id => user_id})
  end

  private
  # Requests from a given user on a fixed couch should NOT overlap each other.
  def doesnt_overlap_own
    other_reservations = CouchReservationRequest.where(user_id: self.user_id).where.not(id: self.id)
    other_reservations.each do |r|
      if not (r.end_date < self.start_date or self.end_date < r.start_date)
        errors.add :base, 'un usuario no puede hacer reservas en un Couch que se superpongan'
        return
      end
    end
  end

  def availability
    if not self.couch_post.is_free?(self.start_date,self.end_date) and self.accepted
      errors.add :base, 'el Couch no está disponible en ese período'
    end   
  end

  def owner
    if self.user_id == self.couch_post.user_id
      errors.add :base, 'un usuario no puede reservar su propio Couch'
    end
  end

  def amount_is_right
    if self.amount > self.couch_post.vacants
      errors.add :amount, 'no puede ser mayor que la capacidad del Couch '
    end
  end

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

  scope :confirmed, -> {where(:accepted => true)}
end
