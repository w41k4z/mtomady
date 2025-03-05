set :output, "log/cron.log"

# Run every minute for testing
every 1.minute do
  rake "treatments:repopulate"
end