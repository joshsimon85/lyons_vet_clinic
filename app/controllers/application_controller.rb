class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    binding.pry
    if resource 
      super
    elsif resource && resource.admin?

    else

    end
  end


  def after_sign_out_path_for(resource)

  end

  def privileged_user?
    user_signed_in? && (is_admin? || is_power_user?)
  end

  def admin?
    current_user.role == 'admin'
  end

  def power_user?
    current_user.role == 'power user'
  end
end
