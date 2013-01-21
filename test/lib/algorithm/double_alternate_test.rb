require 'test_helper'

class TestDoubleAlternate < MiniTest::Unit::TestCase

  def test_double_alternate_returns_false_for_invalid_details
    valid = Modulus::Algorithm::DoubleAlternate.apply([0,8,9,9,9,9,6,6,3,7,4,9,5,8], [2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1])
    assert_equal false, valid
  end
  
  def test_double_alternate_returns_true_for_valid_details
    valid = Modulus::Algorithm::DoubleAlternate.apply([4,9,9,2,7,3,1,2,3,4,5,6,7,8], [2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1])
    assert_equal true, valid
  end
end