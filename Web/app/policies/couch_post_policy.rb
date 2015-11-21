class CouchPostPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end


  def mycouchposts?
true
  end


  def new?
    @current_user
  end

  def index?
    true
  end

  def create?
    @current_user
  end

  def show?
    true
  end

  def edit?
    # TODO
    @current_user.admin?
  end

  def update?
    # TODO
    @current_user.admin?
  end

  def destroy?
    # TODO
    @current_user.admin?
  end

end
