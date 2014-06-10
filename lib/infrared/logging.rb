module Infrared
  module Logging
    extend self
    def logger
      return @logger if defined?(@logger)
      @logger = default_logger
    end

    private 
    def default_logger
      logger = Logger.new($stdout)
      logger.level = Logger::INFO
      logger
    end
  end
end
