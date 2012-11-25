class Admin::StoresController < Admin::BaseController

  def new
    @store = Store.new(params[:store])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])

    if @store.update_attributes(params[:store])
      flash[:notice] = "Store updated"
      redirect_to admin_organization_path(@store.organization) and return
    else
      flash[:error] = "Error saving store"
      render :action => :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    flash[:notice] = "Store deleted"
    redirect_to admin_organization_path(@store.organization)
  end

  def create
    @store = Store.new(params[:store])

    if @store.save
      flash[:notice] = "Store created!"
      redirect_to admin_organization_path(@store.organization) and return
    else
      flash[:error] = "Error creating store"
      render :action => :new
    end
  end
end
