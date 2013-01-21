module Modulus
  module Algorithm
    # This module will apply the modulus eleven check against an account, it has only one method
    # which will apply the check.

    module ModulusEleven
      def self.apply(digits, check_digits)
        weighted_digits = ModulusBase.apply(digits, check_digits)
        total = weighted_digits.reduce(:+)
        (total % 11) == 0
      end
    end
  end
end