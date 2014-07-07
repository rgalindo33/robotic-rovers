require 'io_interface/codec'

module IOInterface
  class Composer

    attr_accessor :data

    def initialize data
      @data = data
    end

    def run
      output = positions_array.map do |position|
        "#{position.x} #{position.y} " + codec.decode_direction( position.orientation )
      end

      output.join("\n")
    end

  private

    def positions_array
      @positions_array ||= data.map do |navigator|
        navigator.rover.position
      end
    end

    def codec
      @codec ||= Codec.new
    end

  end
end