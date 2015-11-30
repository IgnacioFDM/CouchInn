class User < ActiveRecord::Base
  ratyrate_rater
  ratyrate_rateable "rating"
  enum role: [:user, :premium, :admin]
  enum gender: [:male, :female, :other]
  has_many :couch_posts
  has_many :couch_reservation_requests
  has_many :user_feedbacks
    has_many :couch_post_feedbacks

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
end
