desc "Retrieve updated weather forecasts from the MetOffice API"
task :update_forecasts => :environment do
  puts "Updating forecasts"
  UpdateForecastsWorker.perform()
  puts "Done."
end
