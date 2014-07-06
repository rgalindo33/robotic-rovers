require 'spec_helper'

describe Parser do

  let( :data ){ "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }

  subject{ Parser.new data }

  describe '#initialize' do
    it 'sets data' do
      expect( subject.data ).to be_an Array
    end
  end

  describe '#run' do

    let( :parsed_data ){ subject.run }
    
    it 'has the correct structure' do 
      expect( parsed_data ).to have_key :plateu
      expect( parsed_data ).to have_key :rovers
    end
  end

  describe '#compose_position' do

    let( :given_position )   { Position.new 3, 3, :south}
    let( :expected_position ) { '3 3 S' }

    it 'given a position, returns a string with the right structure' do
      expect( subject.compose_position given_position ).to eq expected_position
    end

  end

  describe '#parse_plateu' do
    it 'reads and prepares the size of the plateu' do
      expect( subject.send :parse_plateu ).to eq [ 5,5 ]
    end
  end

  describe '#parse_rovers' do

    let( :rovers ){ subject.send :parse_rovers}

    it 'creates an array of rovers info' do
      expect( rovers.length ).to be 2
    end

    it 'array has a hash with respective keys' do
      expect( rovers.first ).to have_key :position
      expect( rovers.first ).to have_key :instructions
    end
  end

  describe '#parse_position' do

    let( :position )         { "3 3 N"}
    let( :expected_position ){ Position.new 3, 3, :north }

    it 'returns a filled position object' do
      expect( subject.send :parse_position, position ).to eq expected_position
    end

    context 'with invalid input data' do

      let( :invalid_position ){ "3 3 T" }

      it 'raises an exception' do
        expect{ subject.send :parse_position, invalid_position }.to raise_error
      end

    end

  end

  describe '#parse_instructions' do

    let( :instructions )         { 'LMRMMM' }
    let( :expected_instructions) { [ :turn_left, :move, :turn_right, :move, :move, :move ] }

    it 'builds a parsed instructions array' do 
      parsed_instructions = subject.send :parse_instructions, instructions

      expect( parsed_instructions ).to eq expected_instructions
    end

    context 'with invalid input data' do

      let( :invalid_instruction ){ 'LMQWEA@@#' }

      it 'raises an exception' do
        expect{ subject.send :parse_instructions, invalid_instruction }.to raise_error
      end

    end
  end

end