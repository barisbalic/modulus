module Modulus
  module Algorithm
    # This module is responsible for taking a set of digits and returning their correctly
    # weighted counterparts which are then used by ModulusTen, ModulusEleven or DoubleAlternate
    # to validate an account.
    module ModulusBase

      # Apply the basic modulus algorithm, multiplying each digit by a weight and return 
      # the new set of digits.
      def self.apply(sortcode, account_number, check_digits)
        digits = sortcode.split('').concat(account_number.split('')).map{|d| d.to_i }
# STDERR.puts "DIGITS :: #{digits}"
        weighted_digits = digits.each_with_index.map do |d, i|
# STDERR.puts "#{d} * #{check_digits[i]} = #{d*check_digits[i]}"
          d * check_digits[i]
        end

        weighted_digits
      end      
    end
  end
end