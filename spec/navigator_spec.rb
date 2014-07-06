require 'spec_helper'

describe Navigator do

  subject{ Navigator.new data }

  let( :data ) do
    { 
      :plateu => [ 5, 5 ],
      :position => Position.new( 1, 2, :north ),
      :instructions => [ 
        :turn_left, :move, :turn_left, :move, 
        :turn_left, :move, :turn_left, :move, :move 
       ]
    }
  end

  describe '#initialize' do
    it 'creates the plateu' do
      expect( subject.plateu ).to be_a Plateu
    end

    it 'creates the plateu' do
      expect( subject.rover ).to be_a Rover
    end

    it 'creates the plateu' do
      expect( subject.instructions ).to be_a Array
    end
  end

  describe '#run' do

    let( :expected_position ){ Position.new( 1, 3, :north ) }

    it 'explores the plateu according to its instructions' do
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