class TenantsController < ApplicationController
  def initialize
    #@singular = tenants
    #@plural = tenant
    @csingular = Tenant
  end

  def new
    @singular = @csingular.new
  end

  def create
    @csingular.create singular_params
    redirect_to tenants_path
  end

  def index
    @plural = @csingular.all
  end

  def show
    @singular = @csingular.find params[:id]
  end

  def edit
    @singular = @csingular.find params[:id]
  end

  def update
    singular = @csingular.find params[:id]
    singular.update singular_params
    redirect_to tenant_path(singular.id)
  end
  private
  def singular_params
    params.require(:artist).permit()
  end
end