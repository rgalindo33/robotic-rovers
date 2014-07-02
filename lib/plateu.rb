class Plateu

  attr_reader :width, :height

  def initialize coordinates
    @width, @height = coordinates
  end

  def valid_position? x, y
    x <= width and y <= height
  end

end