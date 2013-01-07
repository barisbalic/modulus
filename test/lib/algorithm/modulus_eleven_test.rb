require 'test_helper'

class TestModulusEleven < MiniTest::Unit::TestCase

  def test_modulus_eleven_returns_false_for_invalid_details
    valid = Modulus::Algorithm::ModulusEleven.apply('089999', '66374958', [0, 0, 0, 0, 0, 0, 7, 1, 3, 7, 1, 3, 7, 1])
    assert_equal false, valid
  end
  
  def test_modulus_eleven_returns_true_for_valid_details
    valid = Modulus::Algorithm::ModulusEleven.apply('000000', '58177632', [0, 0, 0, 0, 0, 0, 7, 5, 8, 3, 4, 6, 2, 1])
    assert_equal true, valid
  end
end