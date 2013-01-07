require 'test_helper'

class TestModulusWeighting < MiniTest::Unit::TestCase
  def setup
    @default = {:exception_case => 0, :digit_weights => []}
  end
  
  def test_modulus_ten_weighting_returns_a_ModulusTen_constant
    modulus_ten_weighting = @default.merge({:check_method => 'ModulusTen'})
    algorithm = Modulus::Weighting.new(modulus_ten_weighting).algorithm

    assert_equal Modulus::Algorithm::ModulusTen, algorithm
  end

  def test_modulus_eleven_weighting_returns_a_ModulusEleven_constant
    modulus_eleven_weighting = @default.merge({:check_method => 'ModulusEleven'})
    algorithm = Modulus::Weighting.new(modulus_eleven_weighting).algorithm

    assert_equal Modulus::Algorithm::ModulusEleven, algorithm
  end

  def test_double_alternate_weighting_returns_a_DoubleAlternate_constant
    double_alternate_weighting = @default.merge({:check_method => 'DoubleAlternate'})
    algorithm = Modulus::Weighting.new(double_alternate_weighting).algorithm

    assert_equal Modulus::Algorithm::DoubleAlternate, algorithm
  end
end