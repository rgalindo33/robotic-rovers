class Rover

  CARDINAL_POINTS = [ :north, :east, :south, :west ]

  COORDINATES_MOVEMENTS = {
    :north => [ :y, +1 ],
    :east  => [ :x, +1 ],
    :south => [ :y, -1 ],
    :west  => [ :x, -1 ]
  }

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

  def move
    axis, variation = COORDINATES_MOVEMENTS[ position.orientation ]
    new_coordinate  = ( position.send axis ) + variation 

    position.send :"#{ axis }=", new_coordinate
  end

private
  
  def current_orientation_index
    CARDINAL_POINTS.index position.orientation
  end

end