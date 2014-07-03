require 'spec_helper'

describe Rover do

  let( :position ){ Position.new( 1, 0, :north ) }

  subject{ Rover.new position }

  describe '#initialize' do
    it 'sets the initial rover position' do
      expect( subject.position ).to eq position
    end
  end

  # describe '#move' do
  #   it '' do
  #     # binding.pry
  #   end
  # end

  describe '#turn_left' do
    it 'changes the direction in the proper direction' do
      subject.turn_left
      expect( subject.position.orientation ).to eq :west
    end

  end

  describe '#turn_right' do
    it 'changes the direction in the proper direction' do
      subject.turn_right
      expect( subject.position.orientation ).to eq :east
    end

    it 'successfully turns 360 degrees' do
      4.times do
        subject.turn_right
      end

      expect( subject.position.orientation ).to eq :north
    end
  end

end