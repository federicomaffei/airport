require 'plane'

describe Plane do

	let(:plane) {Plane.new}

	it 'can be flying' do
		expect(plane.flying!).to be_flying
	end

	it 'can be landed' do
		plane = Plane.new
		expect(plane.landed!).not_to be_flying
	end
end