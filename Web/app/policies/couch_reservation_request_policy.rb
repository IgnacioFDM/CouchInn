class CouchReservationRequestPolicy
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

  def foreign_requests_index?
    @current_user
  end
  
  def create?
    @current_user
  end

  def date_filter?
    @current_user
  end

  def date_filter_results?
    @current_user
  end

  def show?
    @current_user
  end

  def respond?
    @current_user
  end

  def edit?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

end
