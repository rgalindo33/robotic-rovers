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

    parser.compose_output rovers
  end

private
  
  def navigators
    @navigators ||= parsed_data.map do |navigator_data|
      Navigator.new navigator_data
    end
  end

  def rovers
    @rovers ||= navigators.map &:rover
  end

end