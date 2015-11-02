class User < ActiveRecord::Base
  enum role: [:user, :premium, :admin]
  enum gender: [:male, :female, :other]
  
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
         
  validates :telephone, :name, :email, :birthdate, presence: true
end
