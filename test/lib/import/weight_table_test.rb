require 'test_helper'

class TestImportWeightsTable < MiniTest::Unit::TestCase
  def setup
    Modulus.namespace = 'VTEST:TEMP'
    keys = Modulus.weight_table_keys
    Modulus.redis.del(keys) unless keys.empty?
    Modulus.namespace = ENV['MODULUS_NAMESPACE'] || 'VTEST'
  end
  
  def test_that_import_modulus_table_can_purge_data
    Modulus.namespace = 'VTEST:TEMP'

    (1..30).each do |i|
      key = "#{Modulus.namespace}:#{i}"
      Modulus.redis.set(key, i)
    end
    
    assert_equal 30, Modulus.weight_table_keys.count
    Modulus::Import::WeightTable.purge!

    assert_equal 0, Modulus.weight_table_keys.count

    Modulus.namespace = ENV['MODULUS_NAMESPACE'] || 'VTEST'
  end
  
  def test_that_import_modulus_table_can_import_from_file
    modulus_weight_table_fixture = File.expand_path('test/fixtures/modulus_weight_table.txt')
    Modulus.namespace = 'VTEST:TEMP'
    Modulus::Import::WeightTable.import_file(modulus_weight_table_fixture)

    expected_double_alternate = {'check_method' => 'DoubleAlternate', 'exception_case' => 0, 'digit_weights' => [9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 1]}
    expected_modulus_eleven = {'check_method' => 'ModulusEleven', 'exception_case' => 0, 'digit_weights' => [0, 0, 0, 0, 0, 0, 8, 7, 6, 5, 4, 3, 2, 1]}
    
    first_sortcode_checks = Modulus.redis.smembers("#{Modulus.namespace}:010004").map{ |w| JSON.load(w) }
    second_sortcode_checks = Modulus.redis.smembers("#{Modulus.namespace}:070116").map{ |w| JSON.load(w) }
    
    assert_equal 6713, Modulus.weight_table_keys.count

    assert_equal 2, first_sortcode_checks.count
    assert_equal expected_double_alternate, first_sortcode_checks.find{|w| w['check_method'] == 'DoubleAlternate' }
    assert_equal expected_modulus_eleven, first_sortcode_checks.find{|w| w['check_method'] == 'ModulusEleven' }

    assert_equal 'ModulusTen', second_sortcode_checks.first['check_method']
    assert_equal 13, second_sortcode_checks.first['exception_case']

    Modulus.namespace = ENV['MODULUS_NAMESPACE'] || 'VTEST'
  end
end