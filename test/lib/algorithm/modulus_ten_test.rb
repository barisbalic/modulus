require 'test_helper'

class TestModulusTen < MiniTest::Unit::TestCase

  def test_modulus_ten_returns_false_for_invalid_details
    valid = Modulus::Algorithm::ModulusTen.apply([0,0,0,0,0,0,5,8,1,7,7,6,3,2], [0, 0, 0, 0, 0, 0, 7, 5, 8, 3, 4, 6, 2, 1])
    assert_equal false, valid
  end
  
  def test_modulus_ten_returns_true_for_valid_details
    valid = Modulus::Algorithm::ModulusTen.apply([0,8,9,9,9,9,6,6,3,7,4,9,5,8], [0, 0, 0, 0, 0, 0, 7, 1, 3, 7, 1, 3, 7, 1])
    assert_equal true, valid
  end
end