require 'spec_helper'

describe Rover do

  let( :position ){ Position.new( 2, 1, :north ) }

  subject{ Rover.new position }

  describe '#initialize' do
    it 'sets the initial rover position' do
      expect( subject.position ).to eq position
    end
  end

  describe '#turn_left' do
    it 'changes the direction in the properly' do
      subject.turn_left

      expect( subject.position.orientation ).to eq :west
    end

  end

  describe '#turn_right' do
    it 'changes the direction in the properly' do
      subject.turn_right

      expect( subject.position.orientation ).to eq :east
    end

    it 'successfully turns 360 degrees' do
      4.times { subject.turn_right }

      expect( subject.position.orientation ).to eq :north
    end
  end

  describe '#move' do
    context 'going north' do
    
      let( :final_position ){ Position.new( 2, 2, :north ) }

      it 'moves on the right direction' do
        subject.move

        expect( subject.position ).to eq final_position
      end
      
    end

    context 'going east' do
    
      let( :final_position ){ Position.new( 3, 1, :east ) }

      it 'moves on the right direction' do
        subject.turn_right
        subject.move

        expect( subject.position ).to eq final_position
      end
      
    end

    context 'going south' do
    
      let( :final_position ){ Position.new( 2, 0, :south ) }

      it 'moves on the right direction' do
        2.times{ subject.turn_right }
        subject.move

        expect( subject.position ).to eq final_position
      end
      
    end

    context 'going west' do
    
      let( :final_position ){ Position.new( 1, 1, :west ) }

      it 'moves on the right direction' do
        subject.turn_left
        subject.move

        expect( subject.position ).to eq final_position
      end
      
    end

  end


end