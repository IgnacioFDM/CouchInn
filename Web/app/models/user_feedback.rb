class UserFeedback < ActiveRecord::Base
	belongs_to :author, class_name: "User", foreign_key: "author_id"
	belongs_to :user, class_name: "User", foreign_key: "user_id"
	validates_presence_of :comment
	validates_presence_of :author
	validates_presence_of :user
	validate :not_reflexive

	def not_reflexive
		if self.author_id == self.user_id
			errors.add :base, "un usuario no puede comentarse a sí mismo"
		end
	end
end
