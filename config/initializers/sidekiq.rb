uri = URI.parse(ENV["REDISCLOUD_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)


Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISCLOUD_URL'] || "redis://localhost:6379/" }
end