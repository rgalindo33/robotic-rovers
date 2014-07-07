require 'spec_helper'

describe IOInterface::Composer do

  let( :nav_data ) do
    { 
      :plateu => [ 5, 5 ],
      :position => Position.new( 3, 3, :south ),
      :instructions => [ :turn_left ]
    }
  end

  let( :another_nav_data ) do
    { 
      :plateu => [ 5, 5 ],
      :position => Position.new( 1, 2, :east ),
      :instructions => [ :move ]
    }
  end

  let( :data ) do
    [
      Navigator.new( nav_data ),
      Navigator.new( another_nav_data )
    ]
  end

  let( :expected_output ) { "3 3 S\n1 2 E" }

  subject { IOInterface::Composer.new data }

  describe '#initialize' do
    it 'sets the data variable' do
      expect( subject.data ).to eq data
    end
  end

  describe '#run' do 
    it 'returns a string representing the rovers position as expected' do
      expect( subject.run ).to eq expected_output
    end
  end

end