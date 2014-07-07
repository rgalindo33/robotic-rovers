require 'spec_helper'

describe IOInterface::Parser do

  let( :data ){ "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }

  subject{ IOInterface::Parser.new data }

  describe '#initialize' do
    it 'creates an array splitting the given data' do
      expect( subject.data.size ).to eq 5
    end
  end

  describe '#run' do

    let( :parsed_data ){ subject.run }

    it 'creates an array of rovers info' do
      expect( parsed_data.length ).to be 2
    end

    it 'created array has a hash with the right keys' do
      expect( parsed_data.first ).to have_key :plateu
      expect( parsed_data.first ).to have_key :position
      expect( parsed_data.first ).to have_key :instructions
    end

  end

  describe '#parse_plateu' do
    it 'prepares the size of the plateu in the right format' do
      expect( subject.send :parse_plateu ).to eq [ 5,5 ]
    end
  end

  describe '#parse_position' do
    context 'with valid input data' do
    
      let( :position )         { "3 3 N"}
      let( :expected_position ){ Position.new 3, 3, :north }

      it 'returns a valid position object' do
        expect( subject.send :parse_position, position ).to eq expected_position
      end
    end

    context 'with invalid input data' do

      let( :invalid_position ){ "3 3 T" }

      it 'raises an exception' do
        expect{ subject.send :parse_position, invalid_position }.to raise_error
      end
    end

  end

  describe '#parse_instructions' do
    context 'with valid input data' do

      let( :instructions )         { 'LMRMMM' }
      let( :expected_instructions) { [ :turn_left, :move, :turn_right, :move, :move, :move ] }

      it 'builds a parsed instructions array' do 
        parsed_instructions = subject.send :parse_instructions, instructions

        expect( parsed_instructions ).to eq expected_instructions
      end
    end

    context 'with invalid input data' do

      let( :invalid_instruction ){ 'LMQWEA@@#' }

      it 'raises an exception' do
        expect{ subject.send :parse_instructions, invalid_instruction }.to raise_error
      end

    end
  end

end