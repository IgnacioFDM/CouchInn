class CouchPostFeedback < ActiveRecord::Base
	belongs_to :user
    belongs_to :couch_post
end
