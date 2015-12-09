class User < ActiveRecord::Base
  ratyrate_rater
  ratyrate_rateable "rating"
  enum role: [:user, :premium, :admin]
  enum gender: [:male, :female, :other]
  has_many :couch_posts
  has_many :couch_reservation_requests
    has_many :couch_post_feedbacks
  has_many :received_feedbacks, class_name: "UserFeedback", foreign_key: "user_id"
  has_many :sent_feedbacks, class_name: "UserFeedback", foreign_key: "author_id"

  def self.i18n_genders(hash = {})
    genders.keys.each { |key| hash[I18n.t("gender_enum.#{key}")] = key }
    hash
  end

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :telephone, :name, :birthdate, presence: true
  validates :telephone, numericality: { only_integer:true }
  validate :old_enough

  def old_enough
    if self.birthdate.present? and self.birthdate > 18.years.ago
      errors.add(:birthdate, 'Debes ser mayor de 18 años')
    end
  end
  
  def is_premium?
    return (!premium_expiration.nil?) && (premium_expiration > DateTime.current)
  end

  def average_rating
    avg_rating = 0
    self.received_feedbacks.each do |f|
      if not f.rating.nil?
        avg_rating = avg_rating + f.rating
      end
    end
    return (avg_rating/[1,self.received_feedbacks.count].max).ceil
  end

end
