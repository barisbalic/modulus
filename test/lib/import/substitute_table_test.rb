require 'test_helper'

class TestImportSubstituteTable < MiniTest::Unit::TestCase
  def setup
    @substitute_table_key = "VTEST:TEMP:substitutes"
  end
  
  def test_that_import_substitute_table_can_purge_data
    Modulus.namespace = 'VTEST:TEMP'
    Modulus.redis.set(@substitute_table_key, "somesubstitutes")
    Modulus::Import::SubstituteTable.purge!
    
    assert_equal nil, Modulus.redis.get(@substitute_table_key)

    Modulus.namespace = ENV['MODULUS_NAMESPACE'] || 'VTEST'
  end
  
  def test_that_import_substitute_table_can_import_from_file
    sortcode_substitute_table_fixture = File.expand_path('test/fixtures/sortcode_substitute_table.txt')
    
    Modulus.namespace = 'VTEST:TEMP'
    Modulus::Import::SubstituteTable.purge!
    Modulus::Import::SubstituteTable.import_file(sortcode_substitute_table_fixture)
    substitutes = JSON.load( Modulus.redis.get(@substitute_table_key) )

    assert_equal 2, substitutes.count
    assert_equal '938017', substitutes['938173']
    assert_equal '938068', substitutes['938289']

    Modulus.namespace = ENV['MODULUS_NAMESPACE'] || 'VTEST'
  end  
end