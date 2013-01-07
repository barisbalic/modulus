require 'test_helper'

class TestDoubleAlternate < MiniTest::Unit::TestCase

  def test_double_alternate_returns_false_for_invalid_details
    valid = Modulus::Algorithm::DoubleAlternate.apply('089999', '66374958', [2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1])
    assert_equal false, valid
  end
  
  def test_double_alternate_returns_true_for_valid_details
    valid = Modulus::Algorithm::DoubleAlternate.apply('499273', '12345678', [2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1])
    assert_equal true, valid
  end
end