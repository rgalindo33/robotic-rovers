require 'spec_helper'

describe Navigator do

  subject{ Navigator.new plateu, rover, instructions }

  let( :plateu ){ Plateu.new [ 5, 5 ] }
  let( :rover ) { Rover.new Position.new( 1, 2, :north ) }
  
  let( :instructions ) do
   [ 
    :turn_left, :move,
    :turn_left, :move,
    :turn_left, :move,
    :turn_left, :move,
    :move
  ]
  end

  describe '#initialize' do
    it 'sets the navigation environment' do
      expect( subject.plateu ).to eq plateu
      expect( subject.rover ).to eq rover
      expect( subject.instructions ).to eq instructions
    end
  end

  describe '#run' do

    let( :expected_position ){ Position.new( 1, 3, :north ) }

    it 'explores the plateu accordint to its instructions' do
      expect( subject.run ).to eq expected_position
    end

    context 'going out of bouds' do
      
      let( :instructions ){ [ :turn_right, :turn_right, :move, :move ] }

      it 'raises an exception' do
        expect{ subject.move }.to raise_error
      end
    end

  end

end