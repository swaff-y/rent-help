class RatingsController < ApplicationController


  def create
    rating = Rating.create(
        user_id: params[:user_id],
        type: params[:type],
        rating: params[:rating]
      )
    rating.save

    puts "============================="
    puts params[:id]
    puts "=============================="
    if params[:type] == "TenantRating"
      redirect_to properties_path
    else
      redirect_to tenants_path
    end
  end


  def update
    rating = Rating.find params[:id]
    rating.update rating_params

    puts "============================="
    puts params[:id]
    puts "=============================="

    if params[:type] == "TenantRating"
      redirect_to properties_path
    else
      redirect_to tenants_path
    end
  end
  private
  def rating_params
    params.permit(:id,:rating,:user_id,:type)
  end
end
