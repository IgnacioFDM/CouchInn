class CouchPostFeedbackPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def new?
    @current_user
  end

  def index?
    @current_user
  end

  def create?
    @current_user
  end

end
