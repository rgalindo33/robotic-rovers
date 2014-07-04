class Navigator

  attr_reader :plateu, :rover, :instructions

  def initialize plateu, rover, instructions=[]
    @plateu       = plateu
    @rover        = rover
    @instructions = instructions
  end

  def go_explore
    instructions.each do |instruction|
      rover.send instruction
      validate_position
    end
  end

private

  def validate_position
    if not plateu.valid_position? rover.position
      raise "Ground control to Major Tom - Rover out of bounds"
    end
  end

end