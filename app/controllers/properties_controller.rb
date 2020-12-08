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
    property.update property_params
    redirect_to property_path(property.id)
  end
  private
  def property_params
    params.require(:property).permit()
  end
end
