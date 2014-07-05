require 'spec_helper'

describe Application do

  let( :input )          { "55\n12N\nLMLMLMLMM\n33E\nMMRMMRMRRM" }
  let( :expected_output ){ "13N\n51E" }

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