class TenantsController < ApplicationController


  def index
    @tenants = Tenant.all
  end

  def show
    if @current_user.present?
      @tenant = Tenant.find params[:id]
    else
      redirect_to login_path
    end
  end

  def edit
    @tenant = Tenant.find params[:id]
  end

  def update
    tenant = Tenant.find params[:id]
    tenant.update tenant_params

    redirect_to root_path
  end

  def property_link
    property = Property.all
    # raise "hell"
    @current_user.properties << property.find(params[:property_id])
    redirect_to tenant_path(@current_user.id)
  end

  private
  def tenant_params
    params.require(:tenant).permit(:type, :name, :email, :phone, :password, :password_confirmation)
  end
end
