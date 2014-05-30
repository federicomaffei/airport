require 'plane'

describe Plane do

	let(:plane) {Plane.new}

	it 'has a flying status when created' do
		expect(plane.flying?).not_to eq nil
  	end
  
  	it 'has a flying status when in the air' do
  		plane.take_off!
  		expect(plane.flying?).not_to eq nil
  	end
  
  	it 'can take off' do
  		plane.take_off!
  		expect(plane).to be_flying
  	end
  
  	it 'changes its status to flying after taking off' do
  		plane.landed!
  		expect(plane).not_to be_flying
  		plane.take_off!
  		expect(plane).to be_flying
	end

end