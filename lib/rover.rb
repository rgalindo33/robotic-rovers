class Rover

  CARDINAL_POINTS = [ :north, :east, :south, :west ]

  attr_accessor :position, :plateu

  def initialize position, plateu
    @position = position
    @plateu   = plateu
  end

  def turn_left
    position.orientation = CARDINAL_POINTS[ current_orientation_index - 1 ]
  end

  def turn_right
    position.orientation = CARDINAL_POINTS[ ( current_orientation_index + 1 ) % 4 ]
  end

  def move
    movement_method = "move_#{position.orientation}".to_sym
    send movement_method

    raise "major Tom to ground control - Rover out of bounds" if not plateu.valid_position? position.x, position.y
  end

private
  
  def current_orientation_index
    CARDINAL_POINTS.index position.orientation
  end

  def move_north
    position.y += 1
  end

  def move_east
    position.x += 1
  end

  def move_south
    position.y -= 1
  end

  def move_west
    position.x -= 1
  end

end