module Modulus
  module Algorithm
    # This module is responsible for taking a set of digits and returning their correctly
    # weighted counterparts which are then used by ModulusTen, ModulusEleven or DoubleAlternate
    # to validate an account.
    module ModulusBase

      # Apply the basic modulus algorithm, multiplying each digit by a weight and return 
      # the new set of digits.
      def self.apply(digits, check_digits)
        weighted_digits = digits.each_with_index.map do |d, i|
          d * check_digits[i]
        end

        weighted_digits
      end      
    end
  end
end