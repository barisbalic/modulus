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

  # Where the fuck did this test come from?
  describe "when performing checks where one check should fail" do
    # it "should return valid for the passing double alternate check with 871427, 46238510" do
    #   exception_11_weighting = Modulus::Weighting.new({
    #     :check_method => 'ModulusEleven', 
    #     :digit_weights => [0,0,5,10,9,8,0,7,6,5,4,3,2,1],
    #     :exception_case => 11
    #     })
    #     
    #   exception_10_weighting = Modulus::Weighting.new({
    #     :check_method => 'ModulusTen', 
    #     :digit_weights => [0,0,1,2,5,3,6,4,8,7,10,9,3,1],
    #     :exception_case => 10
    #     })
    # 
    #   Modulus::WeightTable.expects(:lookup).returns( [exception_11_weighting, exception_10_weighting] )
    # 
    #   pass = Modulus.check('871427', '46238510')
    #   pass.must_equal true
    # end    
  end

  # describe "when performing checks with exceptions" do
  #   it "should return valid for the passing double alternate check with 871427, 46238510" do
  #     exception_11_weighting = Modulus::Weighting.new({
  #       :check_method => 'ModulusEleven', 
  #       :digit_weights => [0,0,5,10,9,8,0,7,6,5,4,3,2,1],
  #       :exception_case => 11
  #       })
  #       
  #     exception_10_weighting = Modulus::Weighting.new({
  #       :check_method => 'ModulusTen', 
  #       :digit_weights => [0,0,1,2,5,3,6,4,8,7,10,9,3,1],
  #       :exception_case => 10
  #       })
  # 
  #     Modulus::WeightTable.expects(:lookup).returns( [exception_11_weighting, exception_10_weighting] )
  # 
  #     pass = Modulus.check('871427', '46238510')
  #     pass.must_equal true
  #   end    
  # end
end