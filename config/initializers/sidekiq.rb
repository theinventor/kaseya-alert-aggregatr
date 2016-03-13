Sidekiq.configure_server do |config|
  if Rails.env.production?
    config.redis = { url: ENV['REDISCLOUD_URL'] } #{ENV['REDIS_PORT_6379_TCP_PORT']}/0" }
  else
  end

end