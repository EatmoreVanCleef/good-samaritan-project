# Twitter.configure do |config|
#   config.consumer_key = TW_CONSUMER_KEY
#   config.consumer_secret = TW_CONSUMER_SECRET
#   config.oauth_token = TW_ACCESS_TOKEN
#   config.oauth_token_secret = TW_ACCESS_TOKEN_SECRET
# end


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "TW_CONSUMER_KEY"
  config.consumer_secret     = "TW_CONSUMER_SECRET"
  config.access_token        = "TW_ACCESS_TOKEN"
  config.access_token_secret = "TW_ACCESS_SECRET"
end