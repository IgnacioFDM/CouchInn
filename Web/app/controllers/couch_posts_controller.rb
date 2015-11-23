class CouchPostsController < ApplicationController
  before_action :authenticate_user!, :except => []
  after_action :verify_authorized, :except => [:index, :show, :mycouchposts]



  def new
    @couch_post = CouchPost.new
    authorize CouchPost
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
    @couch_posts = CouchPost.where(nil)
    @showingall = true

    if params[:s].present?
      @couch_posts = @couch_posts.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{params[:s].downcase}%", "%#{params[:s].downcase}%")
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
    @my_couch_posts = CouchPost.where(user_id: current_user.id)
  end

  def show
  	@couch_post = CouchPost.find(params[:id])
    @category = @couch_post.couch_type
  end

  def destroy
    couch_post = CouchPost.find(params[:id])
    couch_post.destroy!
    redirect_to my_couch_posts_path , notice: "Couch eliminado"
  end

  def update
    @couch_post = CouchPost.find(params[:id])

    if CouchPost.where(:title => params[:couch_post][:title].downcase).count > 0 && CouchPost.where(:title =>params[:couch_post][:title].downcase).first.id != params[:id].to_i
      redirect_to @couch_posts, notice: "Nombre ya existe."
    else
     
      @couch_post.update_attributes(params.require(:couch_post).permit(:title,:disabled))
      if @couch_post.valid?
        redirect_to couch_posts_path , notice: "Post actualizado"
      else
        redirect_to couch_posts_path , notice: "Error al actualizar" 
      end
    end

  end

  def edit
    @couch_post = CouchPost.find(params[:id])
  end

  private
  def couch_post_params
  	params.require(:couch_post).permit(:title, :description, :couch_type_id, :user_id, :zone, :rooms, :vacants, :mainpic)
  end
end
