require 'spec_helper'

describe "Modulus" do
  describe "when performing simple checks against VocaLink data" do
    it "should return valid for the passing modulus ten check with 089999, 66374958" do
      weighting = Modulus::Weighting.new({
        :check_method => 'ModulusTen', 
        :digit_weights => [0,0,0,0,0,0,7,1,3,7,1,3,7,1],
        :exception_case => 0
        })

      Modulus::WeightTable.expects(:lookup).returns([weighting])

      pass = Modulus.check('089999', '66374958')
      pass.must_equal true
    end

    it "should return valid for the passing modulus eleven check with 107999, 8837491" do
      weighting = Modulus::Weighting.new({
        :check_method => 'ModulusEleven', 
        :digit_weights => [0,0,0,0,0,0,8,7,6,5,4,3,2,1],
        :exception_case => 0
        })
    
      Modulus::WeightTable.expects(:lookup).returns([weighting])

      pass = Modulus.check('107999', '88837491')
      pass.must_equal true
    end

    it "should return valid for the passing modulus eleven check with 202959, 63748472" do
      weighting = Modulus::Weighting.new({
        :check_method => 'ModulusEleven', 
        :digit_weights => [0,0,0,0,0,0,0,7,6,5,4,3,2,1],
        :exception_case => 0
        })

      Modulus::WeightTable.expects(:lookup).returns([weighting])

      pass = Modulus.check('202959', '63748472')
      pass.must_equal true
    end

    it "should return valid for the passing double alternate check with 202959, 63748472" do
      weighting = Modulus::Weighting.new({
        :check_method => 'DoubleAlternate', 
        :digit_weights => [2,1,2,1,2,1,2,1,2,1,2,1,2,1],
        :exception_case => 0
        })

      Modulus::WeightTable.expects(:lookup).returns([weighting])

      pass = Modulus.check('202959', '63748472')
      pass.must_equal true
    end    
  end

  # Special exceptions for 'some' Lloyds TSB accounts
  describe "when performing checks where that include exception 10 and 11" do
    describe "exception 10" do
      # it "should return valid for passing 871427, 46238510 with Mod 11" do
      #   exception_10_weighting = Modulus::Weighting.new({
      #     :check_method => 'ModulusEleven', 
      #     :digit_weights => [0,0,5,10,9,8,0,7,6,5,4,3,2,1],
      #     :exception_case => 10
      #     })
      # 
      #   Modulus::WeightTable.expects(:lookup).returns( [exception_10_weighting] )
      # 
      #   pass = Modulus.check('871427', '46238510')
      #   pass.must_equal true
      # end
      # 
      #exception 11
      # it "should return invalid for passing 871427, 46238510 with Mod 11" do
      #   exception_11_weighting = Modulus::Weighting.new({
      #     :check_method => 'ModulusEleven', 
      #     :digit_weights => [0,0,5,10,9,8,0,7,6,5,4,3,2,1],
      #     :exception_case => 11
      #     })
      # 
      #   Modulus::WeightTable.expects(:lookup).returns( [exception_11_weighting] )
      # 
      #   pass = Modulus.check('871427', '46238510')
      #   pass.must_equal false        
      # end
    end
  end
end