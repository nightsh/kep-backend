class V1::LocationsController < ApplicationController
   before_action :authenticate_with_token!, only: [:create, :update,:destroy]

  def index
    render json: Locations.all
  end

  def show
    render json: Location.find(params[:id])
  end

  def create
    location = Location.create(location_params)
    if location
       render json: location, status: 200
    else
      render json: { errors: location.errors }, status: 422
    end
  end

  def destroy
    location = Location.find(params[:id])
    if location.destroy
      render json: {}, status: 204
    else
      render json: {errors: location.errors.full_messages}, status: 422
    end
  end

  protected

  def location_params
    params.require(:location).permit(:city, :state, :country, :latitude, :longitude,
      :location_type)
  end

end
