#Resque.redis = Redis.new(:host=> "localhost", :port=> 6379)

SENTINELS = [{ host: "localhost", port: 26379 },    # vuestra
             { host: "localhost", port: 26380 }]    # una de las otras 2


Resque.redis            = Redis.new(host: "ip-172-31-9-115", port: "6379", sentinels: SENTINELS, role: :master)
# Conexión con un maestro

Dir["/app/app/jobs/*.rb"].each { |file| require file }
