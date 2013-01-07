module Modulus
  module Algorithm
    # This module will apply the modulus ten check against an account, it has only one method
    # which will apply the check.

    module ModulusTen
      def self.apply(sortcode, account_number, check_digits)
        weighted_digits = ModulusBase.apply(sortcode, account_number, check_digits)
        total = weighted_digits.reduce(:+)
        (total % 10) == 0
      end
    end
  end
end