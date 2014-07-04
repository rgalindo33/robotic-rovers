class Plateu

  attr_reader :width, :height

  def initialize coordinates
    @width, @height = coordinates
  end

  def valid_position? position
    position.x.between?( 0, width ) and position.y.between?( 0, height )
  end

end