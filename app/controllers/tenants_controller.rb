class TenantsController < ApplicationController
  def new
    @tenant = Tenant.new
  end

  def create
    Tenant.create tenant_params
    redirect_to tenants_path
  end

  def index
    @tenants = Tenant.all
  end

  def show
    @tenant = Tenant.find params[:id]
  end

  def edit
    @tenant = Tenant.find params[:id]
  end

  def update
    tenant = Tenant.find params[:id]
    tenant.update tenant_params
    redirect_to tenant_path(tenant.id)
  end
  private
  def tenant_params
    params.require(:tenant).permit(:display_name, :name, :email, :phone, :password_digest, :verified)
  end
end
