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
    redirect_to properties_path
  end


  def update
    rating = Rating.find params[:id]
    rating.update rating_params

    puts "============================="
    puts params[:id]
    puts "=============================="
    redirect_to properties_path
  end
  private
  def rating_params
    params.permit(:id,:rating,:user_id,:type)
  end
end
