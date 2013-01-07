module Modulus
  module Import
    module WeightTable
      RANGE_START = 0
      RANGE_END = 1
 
      CHECK_ALGORITHM = 2
      FIRST_CHECK_DIGIT = 3
      CHECK_DIGIT_ENTRIES = 14
      EXCEPTION_CASE = 17


      def self.purge!
        keys = Modulus.weight_table_keys
        Modulus.redis.del( keys ) unless keys.empty?
      end

      def self.import_file(file)
        CSV.foreach(file) do |row|
          cells = row.first.split("\s")
          start_range = cells[RANGE_START]
          end_range = cells[RANGE_END]

          weighting = Modulus::Weighting.new( parse_cells(cells) )

          (start_range..end_range).each do |sort_code|
            key = "#{Modulus.namespace}:#{sort_code}"
            Modulus.redis.sadd( key, weighting.to_json )
          end
        end
      end
      
      private
      def self.parse_cells(cells)
        {
          :digit_weights => cells.slice(FIRST_CHECK_DIGIT, CHECK_DIGIT_ENTRIES).map{ |d| d.to_i },
          :check_method => parse_check_method( cells[CHECK_ALGORITHM] ),
          :exception_case => cells[EXCEPTION_CASE].to_i
        }
      end
      
      def self.parse_check_method(cell_value)
        cell_value == 'DBLAL' ? 'DoubleAlternate' : (cell_value == 'MOD10' ? 'ModulusTen' : 'ModulusEleven')
      end
    end
  end
end


