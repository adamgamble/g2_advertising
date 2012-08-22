class PagesController < ApplicationController
  before_filter :authenticate_user!

  def user_dashboard
  end
end
