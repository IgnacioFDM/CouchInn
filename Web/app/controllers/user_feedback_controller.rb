class UserFeedbackController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  def create
    authorize UserFeedback
    parameters = params.require(:user_feedback).permit(:comment,:user_id)
    user_feedback = UserFeedback.new
    user_feedback.comment = parameters[:comment]
    user_feedback.user_id = parameters[:user_id]
    success = user_feedback.save
    if success then
      redirect_to user_feedback.user , notice: "Comentario añadido."
    else
      redirect_to user_feedback.user , alert: "No se pudo añadir comentario: " << user_feedback.errors.full_messages.to_sentence
    end
  end

  def update
  end

  def show
  end

  def destroy
  end
end
