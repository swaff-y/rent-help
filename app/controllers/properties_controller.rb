class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    property = Property.new property_params
    property.user_id = @current_user.id

    if params[:property][:cover_image].present?
      response = Cloudinary::Uploader.upload params[:property][:cover_image]
      p response
      # save response id into appropriate filed of model object:
      property.cover_image = response['public_id']
    end

    property.save
    redirect_to properties_path
  end

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find params[:id]
  end

  def edit
    @property = Property.find params[:id]
  end

  def update
    property = Property.find params[:id]
    property.attributes = property_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload params[:file]
      puts "====================="
      p req["public_id"]
      puts "====================="
      property.cover_image = req["public_id"]

    end
    property.save
    redirect_to property_path(property.id)
  end

  def image_upload

    redirect_to property_path(params[:id])
  end

  def search
    @results = Property.near(params[:search], 50, units: :km) 
  end

  private
  def property_params
    params.require(:property).permit(:unit, :street, :city, :state, :postcode, :lease_start, :lease_end, :bathrooms, :area, :garage, :storage, :leased, :cover_image, :user_id)
  end
end
