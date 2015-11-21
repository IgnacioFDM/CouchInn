class UserFeedback < ActiveRecord::Base
	validates_presence_of :comment
	belongs_to :user
end
