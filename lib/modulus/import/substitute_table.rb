module Modulus
  module Import
    module SubstituteTable
      def self.purge!
        key = "#{Modulus.namespace}:substitutes"
        Modulus.redis.del( key )
      end

      def self.import_file(file)
        substitutes = {}
        CSV.foreach(file) do |row|
          cells = row.first.split("\s")
          substitutes.merge!({cells[0] => cells[1]})
        end
        
        Modulus.redis.set("#{Modulus.namespace}:substitutes", substitutes.to_json)
      end
    end
  end
end