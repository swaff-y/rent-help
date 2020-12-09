class OwnersController < ApplicationController


  def index
    @owners = Owner.all
  end

  def show
    if @current_user.present?
      @owner = Owner.find params[:id]
    else
      redirect_to login_path
    end
  end

  def edit
    @owner = Owner.find params[:id]
  end

  def update
    owner = Owner.find params[:id]
    owner.update owner_params

    redirect_to root_path
  end

  def property_link
    property = Property.all
    # raise "hell"
    @current_user.properties << property.find(params[:property_id])
    redirect_to owner_path(@current_user.id)
  end

  private
  def owner_params
    params.require(:owner).permit(:property_id)
  end
end
