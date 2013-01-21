module Modulus
  module Algorithm
    # This module will apply the modulus eleven check against an account, it has only one method
    # which will apply the check.

    module ModulusEleven
      def self.apply(sortcode, account_number, check_digits)
        weighted_digits = ModulusBase.apply(sortcode, account_number, check_digits)
        total = weighted_digits.reduce(:+)
# STDERR.puts "TOTAL: #{total}"
# STDERR.puts "DIV: #{(total % 11)}"
        (total % 11) == 0
      end
    end
  end
end