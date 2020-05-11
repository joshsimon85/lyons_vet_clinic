class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if resource && resource.poweruser?

    elsif resource && resource.admin?

    else

    end 
  end


  def after_sign_out_path_for(resource)

  end
end
