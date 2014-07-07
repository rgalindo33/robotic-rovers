require 'plateu'
require 'rover'

class Navigator

  RoverOutOfBoundsError = Class.new StandardError

  attr_reader :plateu, :rover, :instructions

  def initialize data
    @plateu       = Plateu.new data[ :plateu ]
    @rover        = Rover.new  data[ :position ]
    @instructions = data[ :instructions ]

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
      raise RoverOutOfBoundsError,  "Ground control to Major Tom! Rover lost to the void!!"
    end
  end

end