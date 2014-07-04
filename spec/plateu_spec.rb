require 'spec_helper'

describe Plateu do

  subject{ Plateu.new [4, 5] }

  describe '#initialize' do

    it 'sets a width' do
      expect( subject.width ).to eq 4
    end

    it 'sets a height' do
      expect( subject.height ).to eq 5
    end

  end

  describe '#valid_position?' do

    context 'with valid coordinates' do

      let( :position ){ Position.new( 2, 4, :north ) }

      it 'confirms valid coordinates' do
        expect( subject.valid_position? position ).to be true
      end

    end

    context 'with invalid coordinates' do

      let( :position ){ Position.new( 6, 4, :north ) }

      it 'rejects invalid coordinates' do
        expect( subject.valid_position? position ).to be false
      end

    end

  end

end