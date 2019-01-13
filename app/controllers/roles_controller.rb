class RolesController < ApplicationController
  before_action :authenticate_user!

  def upgrade_premium
    if current_user
      if current_user.roles.find_by(name: 'premium').nil?
        current_user.roles << Role.find_by(name: 'premium')
        flash[:notice] = "You are Premium now!" 
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = "You are Premium User alredy, no need to upgrade once!" 
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "You need to sing in first" 
      redirect_back(fallback_location: root_path)
    end
  end
end
