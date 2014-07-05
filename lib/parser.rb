class Parser

  INSTRUCTIONS_RELATION = {
    'L' => :turn_left,
    'R' => :turn_right,
    'M' => :move,
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

private

  def parse_plateu
    data.first.split(//).map &:to_i
  end

  def parse_rovers
    rovers_data.each_slice(2).map do |position, instructions|
      { 
        :position => position,
        :instructions => parse_instructions( instructions )
      }
    end
  end

  def parse_instructions instructions
    instructions.split(//).map do |instruction|
      INSTRUCTIONS_RELATION[ instruction ]
    end
  end

  def rovers_data
    data[1..-1]
  end
  
end