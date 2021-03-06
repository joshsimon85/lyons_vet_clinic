class ApplicationController < ActionController::Base
  helper_method :privileged_user?

  protected

  def after_sign_in_path_for(resource)
    if resource && resource.privileged_user?
      dashboard_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    super
  end

  def privileged_user?
    (current_user && current_user.admin?) ||
    (current_user && current_user.power_user?)
  end

  def require_privileged_user!
    unless privileged_user?
      flash[:alert] = 'You are not permitted to do that'
      redirect_to root_path
    end
  end
end
