require 'test_helper'

class VocaLinkDataTest < MiniTest::Unit::TestCase
  def test_passing_modulus_10_check
    s = Time.now.to_i
    pass = Modulus.check('089999', '66374948')
    STDERR.puts "TOOK: #{Time.now.to_i - s}"
    assert_equal true, pass
  end
end