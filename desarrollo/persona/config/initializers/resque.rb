Resque.redis = Redis.new(:host=> "localhost", :port=> 6380)

Dir["/app/app/jobs/*.rb"].each { |file| require file }
