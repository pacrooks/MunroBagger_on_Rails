require 'httparty'

class UpdateForecastsWorker
  include HTTParty
  format :json

  def self.get_forecast(weather_id, api_key)
    data = get("http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/json/#{weather_id}?res=daily&key=#{api_key}")
    return data
  end

  def self.perform
    key = ENV['MET_OFFICE_API']
    Forecast.all().each do |forecast|
      Thread.new {
        puts "WeatherID = #{forecast.weatherid}"
        data = get_forecast(forecast.weatherid, key)
        puts "Weather data recieved"
        json = data.to_json
        forecast.data = json
        forecast.save
        puts "Weather cached!"
        puts
      }
      sleep(1)
    end
  end

  # def self.perform
  #   Thread.new {
  #     while true do
  #       update_all_forecasts
  #       puts("sleeping...")
  #       sleep(4920)
  #     end
  #   }.join
  # end

end
