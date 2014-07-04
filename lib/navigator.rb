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

      raise "Ground control to Major Tom - Rover out of bounds" if not plateu.valid_position? rover.position
    end
  end


end