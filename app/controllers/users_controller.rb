class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
  end

  def update
    user = User.find params[:id]
    if user.type == "Tenant"
      user.update tenant_params
    else
      user.update owner_params
    end
    redirect_to root_path
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:type, :name, :email, :phone, :password, :password_confirmation)
  end
  def owner_params
    params.require(:owner).permit(:type, :name, :email, :phone, :password, :password_confirmation)
  end
  def tenant_params
    params.require(:tenant).permit(:type, :name, :email, :phone, :password, :password_confirmation)
  end
end
