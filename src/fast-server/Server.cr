require "http/server"
require "./StaticFileHandler"
require "./CompressHandler"

class Server
  def self.run(config)
    port = config["PORT"].to_i || 8080
    public_dir = config["PUBLIC_DIR"] || "./www"

    handler = [
      HTTP::ErrorHandler.new,
      HTTP::LogHandler.new,
      StaticFileHandler.new(public_dir),
    ]

    server = HTTP::Server.new(port.to_i, handler)
    puts "Server listening on http://localhost:" + port.to_s
    server.listen
  end
end
