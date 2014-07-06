$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

require 'navigator'
require 'parser'

class Application

  attr_accessor :parser, :parsed_data

  def initialize data
    @parser      = Parser.new data
    @parsed_data = parser.run
  end

  def run
    navigators.each &:run

    compose_output
  end

private
  
  def navigators
    parsed_data.map do |navigator_data|
      Navigator.new navigator_data
    end
  end

  def compose_output
    return_array = navigators.map do |navigator|
      parser.compose_position navigator.rover.position
    end

    return_array.join("\n")
  end

end