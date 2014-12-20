require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

set :output, "#{path}/log/cron.log"
set :environment, Rails.env.to_sym

every 1.day, at: '00:00' do
  runner "Ticket::reset_todays_nr"
end
