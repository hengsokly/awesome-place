# frozen_string_literal: true

class Api::V1::PlacesController < Api::V1::ApiController
  def index
    places = Place.page(params[:page]).per(params[:per_page])

    render json: places, status: :ok
  end

  def create
    place = Place.new(place_params)
    place.image = params[:image]

    if place.save
      render json: place, status: :created
    else
      render json: place.errors, status: :unprocessable_entity
    end
  end

  def destroy
    place = Place.find(params[:id])
    if place.destroy
      render json: {}, status: :accepted
    else
      render json: place.error, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params['data'] = JSON.parse(params['data'])
    params.require(:data).permit(:name, :location, :image)
  end
end
