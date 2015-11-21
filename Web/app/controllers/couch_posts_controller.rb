class CouchPostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :mycouchposts]
  after_action :verify_authorized, :except => [:mycouchposts]

  def new
    authorize CouchPost
    @couch_post = CouchPost.new
  end

  def create
    authorize CouchPost
    @couch_post = CouchPost.create(couch_post_params)
    if @couch_post.valid?
      redirect_to @couch_post, :notice => "Aviso creado."
    else
      redirect_to new_couch_post_path, :alert => "No se pudo crear el couch. " << @couch_post.errors.full_messages.to_sentence
    end
  end

  def index
    skip_authorization
    @couch_posts = CouchPost.where(nil)
    @showingall = true

    if params[:s].present?
      @couch_posts = @couch_posts.where("title LIKE ? OR description LIKE ?", "%#{params[:s]}%", "%#{params[:s]}%")
      @filter_text = "Buscando \"#{params[:s]}\" "
    else
      @filter_text = "Mostrando todos "
    end
    if params[:cat].present?
      @category = CouchType.where(name: params[:cat]).first
      if @category.present?
        @couch_posts = @couch_posts.where({couch_type: @category })
        @filter_text += "del tipo #{@category.name.capitalize}"
        @showingall = false
      end
    end
    @couch_posts = @couch_posts.paginate(:page => params[:page], :per_page => 5)
  end

  def mycouchposts
    @couch_posts = CouchPost.all
  end

  def show
    skip_authorization
  	@couch_post = CouchPost.find(params[:id])
    @category = @couch_post.couch_type
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
  def couch_post_params
  	params.require(:couch_post).permit(:title, :description, :couch_type_id, :user_id, :zone, :rooms, :vacants, :mainpic)
  end
end
