$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

require 'plateu'
require 'rover'
require 'navigator'
require 'parser'

class Application

  attr_accessor :parser
  attr_reader :navigators

  def initialize data
    @parser = Parser.new data
  end

  def run
    @navigators = prepare_navigators

    navigators.each &:run

    compose_output
  end

private
  
  def prepare_navigators
    plateu = Plateu.new parsed_data[ :plateu ]

    parsed_data[ :rovers ].map do |rover_data|
      rover = Rover.new rover_data[ :position ]

      Navigator.new plateu, rover, rover_data[ :instructions ]
    end
  end

  def parsed_data
    @parsed_data ||= parser.run
  end

  def compose_output
    return_array = navigators.map do |navigator|
      parser.compose_position navigator.rover.position
    end

    return_array.join("\n")
  end

end