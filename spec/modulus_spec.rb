# require 'spec_helper'
# 
# describe Modulus do
#   before do
#     @sortcode = '090126'
#     @account_number = '02149187'
#   end
#   
#   describe 'when validating an account' do
#     it 'should lookup the weighting in the weight table by sortcode' do
#       weighting, algorithm = Object.new, Object.new
#       algorithm.stubs(:apply)
#       weighting.stubs(:algorithm).returns(algorithm)
#       weighting.stubs(:digit_weights).returns([])
#       
#       Modulus::WeightTable.expects(:lookup).with(@sortcode).returns([weighting])
#       Modulus.check(@sortcode, @account_number)
#     end
#     
#     it 'should raise an exception if the sortcode is not found' do
#       Modulus::WeightTable.expects(:lookup).with(@sortcode).returns([])
#       proc{ Modulus.check(@sortcode, @account_number) }.must_raise(Modulus::Exception::SortcodeNotFound)
#     end
#     
#     describe "when there is a modulus ten check for the sortcode" do
#       it 'should apply the modulus ten' do
#         weighting = Object.new
#         weighting.stubs(:algorithm).returns(Modulus::Algorithm::ModulusTen)
#         weighting.stubs(:digit_weights).returns([])
#         
#         Modulus::WeightTable.expects(:lookup).with(@sortcode).returns([weighting])
#         Modulus::Algorithm::ModulusTen.expects(:apply)
#         
#         Modulus.check(@sortcode, @account_number)
#       end
#     end
#     
#     describe "when there is a modulus eleven check for the sortcode" do
#       it 'should apply the modulus eleven' do
#         weighting = Object.new
#         weighting.stubs(:algorithm).returns(Modulus::Algorithm::ModulusEleven)
#         weighting.stubs(:digit_weights).returns([])
#         
#         Modulus::WeightTable.expects(:lookup).with(@sortcode).returns([weighting])
#         Modulus::Algorithm::ModulusEleven.expects(:apply)
#         
#         Modulus.check(@sortcode, @account_number)
#       end
#     end
# 
#     describe "when there is a double alternate check for the sortcode" do
#       it 'should apply the double alternate' do
#         weighting = Object.new
#         weighting.stubs(:algorithm).returns(Modulus::Algorithm::DoubleAlternate)
#         weighting.stubs(:digit_weights).returns([])
#         
#         Modulus::WeightTable.expects(:lookup).with(@sortcode).returns([weighting])
#         Modulus::Algorithm::DoubleAlternate.expects(:apply)
#         
#         Modulus.check(@sortcode, @account_number)
#       end
#     end
#     
#     describe "when there are two checks for the sortcode" do
#       describe "and the first check passes" do
#         it "should not apply the second check" do
#           pass_weighting = Object.new
#           pass_weighting.stubs(:algorithm).returns(Modulus::Algorithm::DoubleAlternate)
#           pass_weighting.stubs(:digit_weights).returns([])
# 
#           fail_weighting = Object.new
#           fail_weighting.stubs(:algorithm).returns(Modulus::Algorithm::ModulusTen)
#           fail_weighting.stubs(:digit_weights).returns([])
# 
#           Modulus::WeightTable
#             .expects(:lookup)
#             .with(@sortcode)
#             .returns( [pass_weighting, fail_weighting] )
#             
#           Modulus::Algorithm::DoubleAlternate.expects(:apply).returns(true)
#           Modulus::Algorithm::ModulusTen.expects(:apply).never
#           
#           Modulus.check(@sortcode, @account_number)
#         end
#       end
#       
#       describe "and the first check fails" do
#         it "should apply the second check" do
#           pass_weighting = Object.new
#           pass_weighting.stubs(:algorithm).returns(Modulus::Algorithm::ModulusTen)
#           pass_weighting.stubs(:digit_weights).returns([])
# 
#           fail_weighting = Object.new
#           fail_weighting.stubs(:algorithm).returns(Modulus::Algorithm::DoubleAlternate)
#           fail_weighting.stubs(:digit_weights).returns([])
# 
#           Modulus::WeightTable
#             .expects(:lookup)
#             .with(@sortcode)
#             .returns( [fail_weighting, pass_weighting] )
#             
#           Modulus::Algorithm::DoubleAlternate.expects(:apply).returns(false)
#           Modulus::Algorithm::ModulusTen.expects(:apply)
#           
#           Modulus.check(@sortcode, @account_number)
#         end
#       end
#     end
#   end
# end