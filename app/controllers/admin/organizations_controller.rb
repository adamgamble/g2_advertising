class Admin::OrganizationsController < Admin::BaseController
  def index
    @organizations = Organization.page(params[:page])
  end

  def new
    @organization = Organization.new(params[:organization])
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      flash[:notice] = "Organization updated!"
      redirect_to :action => :index
    else
      flash[:error] = "There were some errors saving your organization"
      render :action => :edit
    end
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      flash[:notice] = "Organization Created!"
      redirect_to :action => :index
    else
      flash[:error] = "There were some problems saving the organization"
      render :action => :new
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    flash[:notice] = "Deleted Organization"
    redirect_to :action => :index
  end
end
