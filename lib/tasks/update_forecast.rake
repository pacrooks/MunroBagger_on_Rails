desc "Retrieve updated weather forecasts from the MetOffice API"
task :update_forecasts => :environment do
  puts "Updating foorecasts"
  UpdateForecastsWorker.perform()
  puts "done."
end
