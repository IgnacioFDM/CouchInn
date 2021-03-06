class UserFeedback < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  validates_presence_of :comment
  validates_presence_of :author
  validates_presence_of :user
  validates_inclusion_of :rating, in: 1..5, allow_nil: true
  validates_uniqueness_of :user_id, :scope => :author_id
  validate :not_reflexive

  def not_reflexive
    if self.author_id == self.user_id
      errors.add :base, "un usuario no puede comentarse a sí mismo"
    end
  end
end
