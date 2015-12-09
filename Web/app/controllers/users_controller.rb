class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @received_feedbacks = @user.received_feedbacks.order(created_at: :desc)
    @received_feedbacks = @received_feedbacks.paginate(:page => params[:page], :per_page => 5)
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "Usuario actualizado."
    else
      redirect_to users_path, :alert => "No se pudo actualizar."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "Usuario eliminado."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
