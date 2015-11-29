class CouchPostPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end


  def mycouchposts?
    @current_user
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
    @current_user
  end

  def mainpicedit?
  return true if @current_user == @user 
  @current_user
  end

    def mainpicupdate?
  return true if @current_user == @user 
  @current_user
  end


  def edit?
    return true if @current_user == @user || @current_user.admin?
    @current_user
  end

  def update?
    return true if @current_user == @user || @current_user.admin?
    @current_user
  end

  def destroy?
    return true if @current_user == @user  || @current_user.admin?
    @current_user
  end

end
