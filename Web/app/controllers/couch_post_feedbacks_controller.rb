class CouchPostFeedbacksController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

    def new
    authorize CouchPostFeedback
    couch_post_id = params[:couch_post_id]
      @couch_post = CouchPost.find(couch_post_id)
  end

    def create
    authorize CouchPostFeedback
    parameters = params.require(:couch_post_feedback).permit(:comment, :score, :user_id, :couch_post_id)
    couch_post_feedback = CouchPostFeedback.new
    couch_post_feedback.attributes = parameters
    success = couch_post_feedback.save
    if success then
      redirect_to couch_post_feedback.couch_post , notice: "Comentario añadido."
    else
      redirect_to couch_post_feedback.couch_post , alert: "No se pudo publicar el comentario: " << couch_post_feedback.errors.full_messages.to_sentence
    end
  end

  def index
    skip_authorization
    @couch_posts_feedbacks = CouchPostFeedback.all
  end

def show
    skip_authorization
  	@couch_post_feedback = CouchPostFeedback.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
  def couch_post_feedback_params
  	params.require(:couch_post_feedback).permit(:comment, :score, :target_id, :owner_id)
  end

end

