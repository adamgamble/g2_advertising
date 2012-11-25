class Admin::AdminUsersController < Admin::BaseController
  def index
    params[:page] = 1 unless params[:page]
    @admin_users = AdminUser.page(params[:page])
  end

  def new
    @admin_user = AdminUser.new(params[:admin_user])
  end

  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:notice] = "Admin User created"
      redirect_to :action => :index and return
    else
      flash[:error] = "There were errors saving the admin user"
      render :action => :new
    end
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "Admin User Deleted"
    redirect_to :action => :index
  end
end
