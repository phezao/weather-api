class WeatherSearcher
  def initialize(params)
    @weathers = Weather.all
    @params = params
  end

  def call
    @weathers = @weathers.where(date: @params[:date]) if @params[:date].present?
    search_by_city
    @weathers = @weathers.order('date ASC') if @params[:sort].present? && @params[:sort] == 'date'
    @weathers = @weathers.order('date DESC') if @params[:sort].present? && @params[:sort] == '-date'

    @weathers
  end

  def search_by_city
    if @params[:city].present?
      cities = @params[:city].split(',')
      @weathers = @weathers.where(city: cities)
    end
  end
end
