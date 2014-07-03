class Rover

  CARDINAL_POINTS = [ :north, :east, :south, :west ]

  attr_accessor :position

  def initialize position
    @position = position
  end

  def turn_left
    position.orientation = CARDINAL_POINTS[ current_orientation_index - 1 ]
  end

  def turn_right
    position.orientation = CARDINAL_POINTS[ ( current_orientation_index + 1 ) % 4 ]
  end

private
  
  def current_orientation_index
    CARDINAL_POINTS.index position.orientation
  end

end