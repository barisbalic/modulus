require 'spec_helper'

describe Modulus::WeightTable do
  describe 'looking up a weighting by sortcode' do
    it 'should fetch a weighting from redis' do
      sortcode = '089999'
      expected_key = "#{Modulus.namespace}:#{sortcode}"
      json_weighting = "{\"check_method\":\"ModulusTen\",\"exception_case\":0,\"digit_weights\":[0,0,0,0,0,0,7,1,3,7,1,3,7,1]}"

      Modulus.redis.expects(:smembers).with(expected_key).returns( [json_weighting] )
      response = Modulus::WeightTable.lookup(sortcode)
      
      response.class.must_equal Array
      response.each{ |w| w.class.must_equal Modulus::Weighting }
    end
  end
end