#connects our whole program so files can talk to one another
#require all gems

  require 'net/http'
  require 'json'

  require_relative './lib/api'
  require_relative './lib/cli'
  require_relative './lib/brewery'
  require_relative './lib/city'
