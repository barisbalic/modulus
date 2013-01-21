module Modulus
  module Algorithm
    # This module will apply the modulus ten check against an account, it has only one method
    # which will apply the check.

    module ModulusTen
      def self.apply(sortcode, account_number, check_digits)
        # STDERR.puts "DIGITS :: #{check_digits.inspect}"
        weighted_digits = ModulusBase.apply(sortcode, account_number, check_digits)
        # STDERR.puts "WEIGHTED :: #{weighted_digits.inspect}"
        total = weighted_digits.reduce(:+)
        # STDERR.puts "TOTAL :: #{total}"
        (total % 10) == 0
      end
    end
  end
end