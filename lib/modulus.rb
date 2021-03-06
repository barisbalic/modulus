require 'modulus/version'
require 'modulus/configuration'
require 'modulus/weighting'
require 'modulus/weight_table'
require 'modulus/algorithm/modulus_base'
require 'modulus/algorithm/modulus_ten'
require 'modulus/algorithm/modulus_eleven'
require 'modulus/algorithm/double_alternate'
require 'modulus/exceptions'

module Modulus
  # extend Configuration
  extend self
  # Carry out the necessary checks
  def self.check(sortcode, account_number)
    weightings = WeightTable.lookup(sortcode)
    digits = sortcode.split('').concat(account_number.split('')).map{|d| d.to_i }

    raise Modulus::Exception::SortcodeNotFound if weightings.empty?
    weightings.any? do |w|
      weighting = w
      # weighting = w.has_exception_case? ? ExceptionCase.for(w) : w
      weighting.apply_algorithm(digits)
      # weighting.algorithm.apply(digits, weighting.digit_weights)
      # weight_weighting = ExceptionCase.for(w.exception_case) if w.has_exception_case?
    end
  end

  # Set the Redis connection
  def redis=(instance)
    @redis = instance
  end
  
  # Return the Redis connection if set, otherwise return conection 
  # to a local instance.
  def redis
    return @redis if @redis
    self.redis = Redis.respond_to?(:connect) ? Redis.connect(:thread_safe => true) : "localhost:6379"
    self.redis
  end

  # Set the namespace to prepend on keys
  def namespace=(namespace)
    @namespace = namespace
  end
  
  # Return the namespace
  def namespace
    @namespace
  end
  
  # Returns weight table related to this application by their namespace
  def weight_table_keys
    @redis.keys("#{@namespace}:*").reject{ |k| k == "#{@namespace}:substitutes" }
  end
  
  # Returns the sortcode substitute table
  def substitute_table
    # JSON.parse
    # if @redis.exists("#{@namespace}:substitutes")
    #   data = @redis.get("#{@namespace}")
    #   return JSON.parse(data)
    # end
    # []
  end
end
