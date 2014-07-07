require 'position'
require 'io_interface/codec'

module IOInterface
  class Parser

    InvalidInputError = Class.new StandardError

    attr_reader :data

    def initialize string
      @data = string.strip.split("\n")
    end

    def run
      rovers_data.each_slice(2).map do |location, movements|
        { 
          :plateu       => parse_plateu,
          :position     => parse_position( location ),
          :instructions => parse_instructions( movements )
        }
      end
    end

  private

    def parse_plateu
      data.first.split.map &:to_i
    end

    def parse_position location
      args = location.split.map do |literal|
        validate_and_encode literal
      end

      Position.new *args
    end

    def validate_and_encode literal
     case literal
        when /^[0-9]+$/
          literal.to_i
        when -> ( string ) { codec.valid_direction? string }
          codec.encode_direction( literal )
        else invalid_input
      end
    end

    def parse_instructions movements
      movements.split(//).map do |movement|
        codec.encode_instruction( movement ) || invalid_input
      end
    end
   
    def rovers_data
      data.drop(1)
    end

    def codec
      @codec ||= Codec.new
    end

    def invalid_input
      raise InvalidInputError, "The input does not match the defined standard"
    end
    
  end

end