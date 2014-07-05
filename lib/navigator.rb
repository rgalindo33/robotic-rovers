class Navigator

  attr_reader :plateu, :rover, :instructions

  def initialize plateu, rover, instructions=[]
    @plateu       = plateu
    @rover        = rover
    @instructions = instructions
  end

  def run
    instructions.each do |instruction|
      rover.send instruction
      validate_position
    end
    
    rover.position
  end

private

  def validate_position
    if not plateu.valid_position? rover.position
      raise "Ground control to Major Tom! Rover lost to the void!!"
    end
  end

end