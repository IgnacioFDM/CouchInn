class UserPremiumPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  
  def index?
    @current_user
  end

  def create?
    @current_user
  end
  
  def setpaid?
    @current_user.admin?
  end
  
  def setpaidform?
    @current_user.admin?
  end
  
  def getpaid?
    @current_user.admin?
  end

  def getpaidform?
    @current_user.admin?
  end

  
end
