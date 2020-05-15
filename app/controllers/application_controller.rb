class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if resource && resource.privileged_user?
      dashboard_admin_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    super
  end

  def require_privileged_user!
    unless authenticate_user! &&
         (current_user.admin? || current_user.power_user?)
      flash[:alert] = 'You are not permitted to do that'
      redirect_to root_path
    end
  end
end
