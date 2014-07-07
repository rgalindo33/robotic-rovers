require 'spec_helper'

describe IOInterface::Codec do

  subject { IOInterface::Codec.new }

  describe '#valid_direction?' do

    context 'with a valid direction' do
      let( :direction ){ 'N' }

      it { expect( subject.valid_direction? direction ).to be true }
    end

    context 'with an valid direction' do
      let( :direction ) { 'X' }

      it { expect( subject.valid_direction? direction ).to be false }
    end
  end

  describe '#encode_direction' do
    let( :data ){ 'N' }
    it 'returns the proper direction' do
      expect( subject.encode_direction data ).to eq :north
    end
  end

  describe '#decode_direction' do
    let( :data ){ :north }
    it 'returns the proper direction' do
      expect( subject.decode_direction data ).to eq 'N'
    end
  end

  describe '#encode_instruction' do
    let( :data ){ 'L' }
    it 'returns the proper direction' do
      expect( subject.encode_instruction data ).to eq :turn_left
    end
  end
  

end