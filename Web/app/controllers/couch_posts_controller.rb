class CouchPostsController < ApplicationController
  def new
  	  @couch_post = CouchPost.new
  end

  def create
  #	render plain: params[:couch_post].inspect
  @couch_post = CouchPost.new(couch_post_params)
  @couch_post.save
  redirect_to @couch_post
  end

  def index
    @couch_posts = CouchPost.all
  end

  def show
  	@couch_post = CouchPost.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
  def couch_post_params
  	params.require(:couch_post).permit(:title, :description, :username)
  end
end
