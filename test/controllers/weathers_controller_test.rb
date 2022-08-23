require "test_helper"

class WeathersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather = weathers(:one)
  end

  test "should get index" do
    get weathers_url, as: :json
    assert_response :success
  end

  test "should create weather" do
    assert_difference('Weather.count') do
      post weathers_url, params: { weather: { city: @weather.city, date: @weather.date, lat: @weather.lat, lon: @weather.lon, temperatures: @weather.temperatures } }, as: :json
    end

    assert_response 201
  end

  test "should show weather" do
    get weather_url(@weather), as: :json
    assert_response :success
  end

  test "should update weather" do
    patch weather_url(@weather), params: { weather: { city: @weather.city, date: @weather.date, lat: @weather.lat, lon: @weather.lon, temperatures: @weather.temperatures } }, as: :json
    assert_response 200
  end

  test "should destroy weather" do
    assert_difference('Weather.count', -1) do
      delete weather_url(@weather), as: :json
    end

    assert_response 204
  end
end
