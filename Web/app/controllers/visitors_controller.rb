class VisitorsController < ApplicationController

	  def index
    @couch_posts = CouchPost.all
  end
  
end
