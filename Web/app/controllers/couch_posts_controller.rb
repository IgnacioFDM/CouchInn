class CouchPostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  after_action :verify_authorized, :except => [:index]



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
    authorize CouchPost
    @my_couch_posts = CouchPost.where(user_id: current_user.id)
  end

    def visitedcouchposts
    authorize CouchPost
    couch_reqs= CouchReservationRequest.requests_made_by_user(current_user.id)
    couch_reqs= couch_reqs.where(accepted: true)
      @visited_couch_posts = Array.new
      couch_reqs.each do |r|
        if(r.start_date < Date.today)
        c= CouchPost.find(r.couch_post_id)
        @visited_couch_posts << c
      end
      end
   
   
   end

  def show
    authorize CouchPost
  	@couch_post = CouchPost.find(params[:id])
    @category = @couch_post.couch_type
    @couch_post_feedbacks = CouchPostFeedback.where(couch_post_id: @couch_post.id)
    @couch_post_feedback_val = 0
    if @couch_post_feedbacks.count > 0
      @couch_post_feedback_scored = 0
         @couch_post_feedbacks.each do |feed| 
          if(feed.score != nil)
          @couch_post_feedback_val =  @couch_post_feedback_val + feed.score
            @couch_post_feedback_scored += 1
          end
         end 
        if (@couch_post_feedback_scored > 0)
           @couch_post_feedback_val =  @couch_post_feedback_val / @couch_post_feedback_scored
        end
    end 
  end

  def destroy
    authorize CouchPost
    couch_post = CouchPost.find(params[:id])
    couch_post.destroy!
    redirect_to my_couch_posts_path , notice: "Couch eliminado"
  end

  def update
    authorize CouchPost
    @id_a_cambiar = params[:id]
    @couch_post = CouchPost.find(params[:id])

    
      @couch_post.update_attributes(params.require(:couch_post).permit(:id, :title, :couch_type_id, :description, :rooms, :vacants, :mainpic, :zone))
      if @couch_post.valid?
        redirect_to my_couch_posts_path , notice: "Post actualizado"
      else
        redirect_to my_couch_posts_path , notice: "Error al actualizar" 
      end

  end




  def edit
        authorize CouchPost
    @couch_post = CouchPost.find(params[:id])
    @id_a_cambiar = params[:id]
  end

  def mainpicedit
    authorize CouchPost
    @couch_post = CouchPost.find(params[:id])
    @id_a_cambiar = params[:id]
  end

  def mainpicupdate
  authorize CouchPost
  @id_a_cambiar = params[:id]
  @couch_post = CouchPost.find(params[:id])
  @couch_post.update_attributes(params.require(:couch_post).permit(:id, :mainpic))
      if @couch_post.valid?
        redirect_to my_couch_posts_path , notice: "Imagen actualizada"
      else
        redirect_to my_couch_posts_path , notice: "Error al actualizar" 
      end

  end

  private
  def couch_post_params
  	params.require(:couch_post).permit(:title, :description, :couch_type_id, :user_id, :zone, :rooms, :vacants, :mainpic)
  end
end
