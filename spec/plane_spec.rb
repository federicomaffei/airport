require 'plane'

describe Plane do

	let(:plane) {Plane.new}

  context 'one plane' do

    it 'is landed when created' do
      expect(plane.flying?).to be_falsey
    end

    it 'can take off and be flying' do
      plane.fly!
      expect(plane).to be_flying
    end

    it 'changes its status when landed' do
      plane.fly!
      plane.land!
      expect(plane).not_to be_flying
    end

    it 'returns a string with its state' do
      expect(plane.return_state).to eq 'landed'
      plane.fly!
      expect(plane.return_state).to eq 'flying'
    end

  end
end