module Modulus
  # This module is responsible for retrieving a weighting entries from Redis.
  
  module WeightTable
    # Lookup the weighting entry by sortcode.
    def self.lookup(sortcode)
      STDERR.puts "LOOKING UP #{Modulus.namespace}:#{sortcode}"
      list = Modulus.redis.smembers("#{Modulus.namespace}:#{sortcode}")
      weightings = list.map{ |w| parse_json(w) }
      weightings || []
    end
    
    private
    def self.parse_json(json)
      hash = JSON.parse(json)

      Weighting.new({
        :digit_weights => hash['digit_weights'],
        :check_method => hash['check_method'],
        :exception_case => hash['exception_case']
      })
    end
  end
end