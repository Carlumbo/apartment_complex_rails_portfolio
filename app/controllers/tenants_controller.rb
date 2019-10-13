class TenantsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tenant = tenant.new
  end
  def create
    @tenant = Tenant.new(name: tenant_params)[:name], user: current_user)
    if @tenant.save 
      @tenant.user.tenant_role
      redirect_to tenant_path(@tenant)
    else 
      flash[:notice] = "Error occured: Tenant not saved"
      redirect_to new_tenant_path 
    end 
  end 

  private

  def tenant_params
      params.require(:tenant).permit(:name, :apartment_id)
  end
end
