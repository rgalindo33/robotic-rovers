require File.expand_path('../position', __FILE__)

class Parser

  INSTRUCTIONS_RELATION = {
    'L' => :turn_left,
    'R' => :turn_right,
    'M' => :move,
  }

  POSITIONS_RELATION = {
    'N' => :north,
    'E' => :east,
    'S' => :south,
    'W' => :west
  }

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

  def compose_position position
    "#{position.x} #{position.y} " + POSITIONS_RELATION.key( position.orientation )
  end

private

  def parse_plateu
    data.first.split.map &:to_i
  end

  def parse_position location
    args = location.split.map do |literal|
      case literal
        when /^[0-9]+$/ then literal.to_i
        when /N|S|E|W/  then POSITIONS_RELATION[ literal ]  
        else invalid_input
      end
    end

    Position.new *args
  end

  def parse_instructions movements
    movements.split(//).map do |instruction|
      INSTRUCTIONS_RELATION[ instruction ] || invalid_input
    end
  end
 
  def rovers_data
    data[1..-1]
  end

  def invalid_input
    raise "Invalid input data"
  end
  
end