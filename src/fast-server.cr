require "./fast-server/Server"
require "dotenv"

config = Dotenv.load
Server.run(config)
