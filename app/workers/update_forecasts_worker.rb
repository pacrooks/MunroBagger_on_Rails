require 'httparty'
require_relative('./api_key.rb')

# key = ENV['MET_OFFICE_API']

class UpdateForecastsWorker
  include HTTParty
  format :json

  def self.get_forecast(weather_id, api_key)
    data = get("http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/json/#{weather_id}?res=daily&key=#{api_key}")
    return data
  end

  def self.update_all_forecasts
    key = get_key
    Forecast.all().each do |forecast|
      Thread.new {
        puts "MunroID = #{forecast.mountain_id}"
        # weather_id = get_munro_location_code(counter)
        puts "WeatherID = #{forecast.weatherid}"
        data = get_forecast(forecast.weatherid, key)
        puts "Weather data recieved"
        json = data.to_json
        puts "Converted to JSON"
        forecast.data = json
        forecast.save
        puts "Weather cached!"
        puts
      }
      sleep(1)
    end
  end

  def self.perform
    Thread.new {
      while true do
        update_all_forecasts
        puts("sleeping...")
        sleep(4920)
      end
    }.join
  end

end
