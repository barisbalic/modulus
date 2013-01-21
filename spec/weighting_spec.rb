require 'spec_helper'

describe 'Weighting' do
  before do
    @default = {:exception_case => 0, :digit_weights => [0]}
  end

  describe 'when calling the Weighting#apply_algorithm for a modulus 10 check' do
    it 'should call ModulusTen#apply to validate the account details' do
      Modulus::Algorithm::ModulusTen.expects(:apply)
      
      weighting = @default.merge({:check_method => 'ModulusTen'})
      Modulus::Weighting.new(weighting).apply_algorithm([0])
    end
  end

  describe 'when calling the Weighting#apply_algorithm for a modulus 11 check' do
    it 'should call ModulusEleven#apply to validate the details' do
      Modulus::Algorithm::ModulusEleven.expects(:apply)
      
      weighting = @default.merge({:check_method => 'ModulusEleven'})
      Modulus::Weighting.new(weighting).apply_algorithm([0])
    end
  end
  
  describe 'when calling the Weighting#apply_algorithm for a double alternate check' do
    it 'should call DoubleAlternate#apply to validate the details' do
      Modulus::Algorithm::DoubleAlternate.expects(:apply)
      
      weighting = @default.merge({:check_method => 'DoubleAlternate'})
      Modulus::Weighting.new(weighting).apply_algorithm([0])
    end
  end  
end