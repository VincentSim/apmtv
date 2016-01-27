Yt.configure do |config|
  config.log_level = :debug
  config.client_id = ENV["YT_CLIENT_ID"]
  config.client_secret = ENV["YT_CLIENT_SECRET"]
  config.api_key = ENV["YT_API_KEY"]
end

ACCOUNT = Yt::Account.new access_token: "#{ENV['ACCESS_TOKEN']}"
# ACCOUNT = Yt::Account.new refresh_token: "#{ENV['REFRESH_TOKEN']}"



