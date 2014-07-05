class Parser

  require 'position'

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
    @data = string.split
  end

  def run
    {
      :plateu => parse_plateu,
      :rovers => parse_rovers
    }
  end

  def compose_position position
    "#{position.x}#{position.y}" + POSITIONS_RELATION.key( position.orientation )
  end

private

  def parse_plateu
    data.first.split(//).map &:to_i
  end

  def parse_rovers
    rovers_data.each_slice(2).map do |location, movements|
      { 
        :position     => parse_position( location ),
        :instructions => parse_instructions( movements )
      }
    end
  end

  def parse_position location
    args = location.split(//).map do |literal|
      literal =~ /^[0-9]+$/ ? literal.to_i : POSITIONS_RELATION[ literal ]  
    end

    Position.new *args
  end

  def parse_instructions movements
    movements.split(//).map do |instruction|
      INSTRUCTIONS_RELATION[ instruction ]
    end
  end
 
  def rovers_data
    data[1..-1]
  end
  
end