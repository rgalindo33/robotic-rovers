require 'spec_helper'

describe Application do

  let( :input )          { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }
  let( :expected_output ){ "1 3 N\n5 1 E" }

  subject{ Application.new input }

  describe '#initialize' do

    it 'sets the data' do
      expect( subject.data ).to eq input
    end
  end

  describe '#parsed_data' do

    let( :parsed_data ){ subject.send :parsed_data }

    it 'parses the given data' do
      expect( parsed_data.size ).to be 2
    end

  end

  describe '#run' do

    let( :output ){ subject.run }
    
    it 'returns the expected output' do
      expect( output ).to eq expected_output
    end

  end

end