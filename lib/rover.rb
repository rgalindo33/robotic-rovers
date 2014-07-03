class Rover

  CARDINAL_POINTS = [ :north, :east, :south, :west ]

  attr_accessor :x_position, :y_position, :orientation

  def initialize coordinates
    @x_position, @y_position, @orientation = coordinates
  end

  def turn_left
    self.orientation = CARDINAL_POINTS[ current_orientation_index - 1 ]
  end

  def turn_right
    self.orientation = CARDINAL_POINTS[ ( current_orientation_index + 1 ) % 4 ]
  end

private
  
  def current_orientation_index
    CARDINAL_POINTS.index orientation
  end

end