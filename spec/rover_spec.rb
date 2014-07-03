require 'spec_helper'

describe Rover do

  subject{ Rover.new [ 1, 0, :north ] }

  describe '#initialize' do
    it 'sets the initial rover position' do
      expect( subject.x_position ).to eq 1
      expect( subject.y_position ).to eq 0
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
      expect( subject.orientation ).to eq :west
    end

  end

  describe '#turn_right' do
    it 'changes the direction in the proper direction' do
      subject.turn_right
      expect( subject.orientation ).to eq :east
    end

    it 'successfully turns 360 degrees' do
      4.times do
        subject.turn_right
      end

      expect( subject.orientation ).to eq :north
    end
  end

end