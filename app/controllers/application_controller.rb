class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      "/admin"
    elsif resource.is_a?(User)
     current_user_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    "/"
  end
end
