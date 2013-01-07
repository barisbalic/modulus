module Modulus
  module Configuration
    # DEFAULT_REDIS           = nil
    # DEFAULT_REDIS_HOST      = 'localhost'
    # DEFAULT_REDIS_PORT      = '6379'
    DEFAULT_KEY_NAMESPACE   = 'M'
    
    def self.extended(base)
      base.reset
    end
    
    def configure
      yield self
    end
    
    def reset
      self.redis = nil
      # self.redis_port = DEFAULT_REDIS_PORT
      self.key_namespace = DEFAULT_KEY_NAMESPACE
    end
    
    def redis=(connection)
      @redis = connection
    end
    # def redis_host=(value)
    #   @redis_host = value
    # end
    # 
    # def redis_port=(value)
    #   @redis_port = value
    # end

    def namespace=(value)
      @namespace = value
    end
  end
end