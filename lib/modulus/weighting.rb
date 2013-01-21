module Modulus
  class Weighting
    # This class holds the data associated with a single weighting from the modulus weight table,
    # it exposes the check method, an exception case if there is one, and the weights.
    #
    # The to_json method is used to store the weighting in redis.
    # The algorithm method is used to return a constant that can validate the details.

    attr_reader :digit_weights, :check_method, :exception_case
    def initialize(opts)
      @digit_weights = opts[:digit_weights]
      @check_method = opts[:check_method]
      @exception_case = opts[:exception_case]
    end
    
    # Return a JSON representation of the weighting for persistence.
    def to_json
      {:check_method => @check_method, :exception_case => @exception_case, :digit_weights => @digit_weights}.to_json
    end
    
    # Return a constant representing the module for the check method.
    def algorithm
      Object.const_get('Modulus').const_get('Algorithm').const_get(@check_method)
    end
    
    # A convenience method to check if the weighting has any exception cases.
    def has_exception_case?
      @exception_case > 0
    end
  end
end