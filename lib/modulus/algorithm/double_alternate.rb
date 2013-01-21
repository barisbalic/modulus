module Modulus
  module Algorithm
    # This module will apply the double alternate check against an account, it has only one method
    # which will apply the check.

    module DoubleAlternate
      # Apply the double alternate algorithm, which entails the following:
      #
      # * Apply weighting to each digit.
      # * Separate the new values into individual digits (ie. 10 => 1,0).
      # * Divide by 10 and expect no remainder.
      def self.apply(digits, check_digits)
        weighted_digits = ModulusBase.apply(digits, check_digits)
        total = get_individual_digits(weighted_digits).reduce(:+)
        (total % 10) == 0
      end
      
      private
      # Returns a list of individual integers from a collection 
      def self.get_individual_digits(digits)
        # replace this sucka with (x / 10).floor + (x % 10)
        string_list = digits.inject(""){ |str, d| str << d.to_s; str }
        string_list.split('').map{ |d| d.to_i }
      end
    end
  end
end