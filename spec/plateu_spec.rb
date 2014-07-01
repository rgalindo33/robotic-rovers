require 'spec_helper'

describe Plateu do

  subject { Plateu.new 5, 4 }

  describe '#initialize' do

    it 'sets a height' do
      expect( subject.height ).to eq 5
    end
    it 'sets a width' do
      expect( subject.width ).to eq 4
    end

  end

end