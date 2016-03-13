uri = URI.parse(ENV["REDISCLOUD_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)


Sidekiq.configure_server do |config|
  # if Rails.env.production?
  #   config.redis = { url: ENV['REDISCLOUD_URL'] } #{ENV['REDIS_PORT_6379_TCP_PORT']}/0" }
  #
  # end

end