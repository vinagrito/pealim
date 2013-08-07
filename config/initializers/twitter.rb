TwitterSettings = YAML.load_file("#{Rails.root}/config/settings/twitter.yml")
Twitter.configure do |config|
  config.consumer_key = TwitterSettings["consumer_key"]
  config.consumer_secret = TwitterSettings["consumer_secret"]
  config.oauth_token = TwitterSettings["oauth_token"]
  config.oauth_token_secret = TwitterSettings["oauth_token_secret"]
end
