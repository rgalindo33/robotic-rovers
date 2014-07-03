require 'spec_helper'

describe Position do

  subject{ Position.new( 1, 0, :north ) }

  describe 'data structure' do
    it { should respond_to( :x ) }
    it { should respond_to( :y ) }
    it { should respond_to( :orientation ) }
  end
end