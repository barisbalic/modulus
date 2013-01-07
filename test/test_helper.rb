require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/pride'
require 'minitest/benchmark' if ENV["BENCH"]
require 'redis'
require 'csv'
require 'json'

$dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift $dir + '/../lib'

require 'modulus'
require 'modulus/import/weight_table'
require 'modulus/import/substitute_table'

Modulus.redis = Redis.new
Modulus.namespace = ENV['MODULUS_NAMESPACE'] || "VTEST"
