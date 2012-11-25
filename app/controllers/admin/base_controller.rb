class Admin::BaseController < ActionController::Base
  layout "admin"
  before_filter :authenticate_admin!

  private
  def authenticate_admin!
    redirect_to new_admin_user_session_path unless current_admin_user
  end
end
