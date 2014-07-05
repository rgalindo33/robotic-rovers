require 'spec_helper'

describe Application do

  let( :input )          { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }
  let( :expected_output ){ "1 3 N\n5 1 E" }

  subject{ Application.new input }

  describe '#initialize' do
    it 'instanciates a parser' do
      expect( subject.parser ).to be_a Parser
    end
  end

  describe '#run' do

    let( :output ){ subject.run }
    
    it 'returns the expected output' do
      expect( output ).to eq expected_output
    end

  end

end