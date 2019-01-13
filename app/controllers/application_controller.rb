class ApplicationController < ActionController::Base
  def authorize_admin
    unless current_user.try(:is_admin?)
      flash[:alert] = "You are not Admin user, not allow to access this page"
      redirect_to root_path
    end
  end
end
