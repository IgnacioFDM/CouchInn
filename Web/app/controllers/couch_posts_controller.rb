class CouchPostsController < ApplicationController
  def new
  end

  def create
  #	render plain: params[:couch_post].inspect
  @couch_post = Couch_post.new(couch_post_params)
  @couch_post.save
  redirect_to @couch_post
  end

  def index
    @couch_posts = Couch_post.all
    authorize Couch_post
  end

  def show
  	@copo = Couch_post.find(params[:id])
    authorize @copo
  end

  private
  def couch_post_params
  	params.require(:couch_post).permit(:title, :description)
  end
end
