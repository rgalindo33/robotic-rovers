class Plateu

  attr_reader :width, :height

  def initialize coordinates
    @width, @height = coordinates
  end

  def valid_position? x, y
    x.between?( 0, width ) and y.between?( 0, height )
  end

end