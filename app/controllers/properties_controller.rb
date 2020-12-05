class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    Property.create property_params
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
