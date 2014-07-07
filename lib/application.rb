$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

require 'navigator'
require 'io_interface/parser'
require 'io_interface/composer'

class Application

  attr_accessor :data

  def initialize data
    @data = data
  end

  def run
    navigators.each &:run

    composer.run
  end

private

  def parser
    @parser ||= IOInterface::Parser.new data
  end

  def composer
    @composer ||= IOInterface::Composer.new navigators
  end

  def parsed_data
    @parsed_data ||= parser.run
  end
  
  def navigators
    @navigators ||= parsed_data.map do |navigator_data|
      Navigator.new navigator_data
    end
  end

end