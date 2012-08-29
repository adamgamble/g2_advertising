class NotificationPreferencesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @notification_preferences = current_user.notification_preferences
  end

  def new
    @notification_preference = NotificationPreference.new(params[:notification_preference])
  end

  def create
    @notification_preference = current_user.notification_preferences.new(params[:notification_preference])
    if @notification_preference.save
      flash[:notice] = "Notification Preference Saved"
      redirect_to :action => :index
    else
      flash[:error] = "Unable to Save Notification"
      render :action => :new
    end
  end

  def destroy
    @notification_preference = current_user.notification_preferences.find(params[:id])
    @notification_preference.destroy
    flash[:notice] = "Notification destroyed"
    redirect_to :action => :index
  end

end
