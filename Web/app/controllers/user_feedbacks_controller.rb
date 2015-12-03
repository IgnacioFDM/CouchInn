class UserFeedbacksController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def new
    authorize UserFeedback
    target_user_id = params[:user_id].to_i
    if target_user_id == current_user.id 
      redirect_to :back, alert: "Un usuario no puede calificarse a sí mismo!"
    elsif not UserFeedback.where(user_id: target_user_id, author_id: current_user.id).empty?
      redirect_to :back, alert: "Ya calificaste a este usuario!"
    else
      @user = User.find(target_user_id)
    end
  end

  def create
    authorize UserFeedback
    parameters = params.require(:user_feedback).permit(:comment,:user_id,:author_id,:rating)
    user_feedback = UserFeedback.new
    user_feedback.attributes = parameters
    success = user_feedback.save
    if success then
      redirect_to user_feedback.user , notice: "Calificación añadida."
    else
      redirect_to user_feedback.user , alert: "No se pudo añadir calificación: " << user_feedback.errors.full_messages.to_sentence
    end
  end

  def index
    authorize UserFeedback
    @sent_feedbacks = current_user.sent_feedbacks.order(:created_at => :desc)
    @sent_feedbacks = @sent_feedbacks.paginate(:page => params[:page], :per_page => 5)
  end

end
