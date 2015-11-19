class CouchPostFeedbacksController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

    def new
    authorize CouchPostFeedback
    @couch_post_feedback = CouchPostFeedback.new
  end

  def create
    authorize CouchPostFeedback
    @couch_post_feedback = CouchPostFeedback.create(couch_post_feedback_params)
    if @couch_post_feedback.valid?
      redirect_to CouchPost.find(@couch_post_feedback.target_id), :notice => "Comentario creado."
    else
      redirect_to CouchPost.find(@couch_post_feedback.target_id), :alert => "No se pudo crear el comentario. " << @couch_post_feedback.errors.full_messages.to_sentence
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
