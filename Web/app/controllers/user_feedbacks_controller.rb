class UserFeedbacksController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  def create
    authorize UserFeedback
    parameters = params.require(:user_feedback).permit(:comment,:user_id,:author_id)
    user_feedback = UserFeedback.new
    user_feedback.attributes = parameters
    success = user_feedback.save
    if success then
      redirect_to user_feedback.user , notice: "Comentario añadido."
    else
      redirect_to user_feedback.user , alert: "No se pudo añadir comentario: " << user_feedback.errors.full_messages.to_sentence
    end
  end

  def index
    authorize UserFeedback
    @sent_feedbacks = current_user.sent_feedbacks.order(:updated_at => :asc)
    @sent_feedbacks = @sent_feedbacks.paginate(:page => params[:page], :per_page => 5)
  end

end
