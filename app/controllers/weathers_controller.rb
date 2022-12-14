class WeathersController < ApplicationController
  before_action :set_weather, only: %i[show update destroy]

  # GET /weathers
  def index
    @weathers = WeatherSearcher.new(params).call

    render json: @weathers
  end

  # GET /weathers/1
  def show
    render json: @weather
  end

  # POST /weathers
  def create
    @weather = Weather.new(weather_params)

    if @weather.save
      render json: @weather, status: :created, location: @weather
    else
      render json: @weather.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weathers/1
  def update
    if @weather.update(weather_params)
      render json: @weather
    else
      render json: @weather.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weathers/1
  def destroy
    @weather.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weather
    @weather = Weather.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weather_params
    params.require(:weather).permit(:lat, :lon, :city, :date, temperatures: [])
  end
end
