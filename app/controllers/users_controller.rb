class UsersController < ApplicationController
  before_action :authorize_admin, only: [:index]
  before_action :set_user, only: [:promote, :demote]

  def index
    @users = User.all.order(id: :DESC)
  end

  def promote
    @user.roles << Role.find_by(name: 'admin')
    flash[:notice] = "Promote success, #{@user.email} is Admin user now!" 
    redirect_back(fallback_location: users_path)
  end

  def demote
    admin_role = Role.find_by(name: 'admin')
    if admin_role.users.length == 1
      flash[:alert] = "Demote false, #{@user.email} is last Admin user!" 
      redirect_back(fallback_location: users_path)
    else
      @user.roles.delete(admin_role.id)
      flash[:notice] = "Demote success,#{@user.email} is Normal user now!" 
      redirect_back(fallback_location: users_path)
    end
  end

  private 

  def authorize_admin
    unless current_user.try(:is_admin?)
      flash[:alert] = "You are not Admin user, not allow to access this page"
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
