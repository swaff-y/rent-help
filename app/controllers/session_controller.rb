class SessionController < ApplicationController
  def new
    tenant_user = find.find_by email: params[:email]
  end

  def create
  end

  def destroy
  end
end
