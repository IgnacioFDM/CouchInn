class CouchPostsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def new
    authorize CouchPost
    @couch_post = CouchPost.new
  end

  def create
    authorize CouchPost
    @couch_post = CouchPost.create(couch_post_params)
    if @couch_post.valid?
      redirect_to @couch_post, :notice => "Tipo creado."
    else
      redirect_to new_couch_post_path, :alert => "No se pudo crear el couch. " << @couch_post.errors.full_messages.to_sentence
    end
  end

  def index
    skip_authorization
    @couch_posts = CouchPost.all
  end

  def show
    skip_authorization
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
  	params.require(:couch_post).permit(:title, :description, :couch_type_id, :username, :zone, :rooms, :vacants, :mainpic)
  end
end
