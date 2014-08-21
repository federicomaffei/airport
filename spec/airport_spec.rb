require 'airport'
require 'plane'

describe Airport do

    let(:airport) { Airport.new }
    let(:plane) { Plane.new }

    def fill(airport)
        airport.set_capacity(20)
        20.times do
            plane = Plane.new
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.allows_plane_landing(plane)
        end
    end

    context 'taking off and landing' do
        it 'a plane can land' do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.allows_plane_landing(plane)
            expect(airport.plane_status_check(plane)).to eq 'landed'

        end

        it 'a plane can take off' do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.allows_plane_takeoff(plane)
            expect(airport.plane_status_check(plane)).to eq 'flying'
        end

        it 'a plane cannot land twice' do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.allows_plane_landing(plane)
            airport.allows_plane_landing(plane)
            expect(airport.landed_planes_count).to eq 1
        end

        it 'a plane cannot takeoff twice' do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.allows_plane_takeoff(plane)
            airport.allows_plane_takeoff(plane)
            expect(airport.flying_planes_count).to eq 1
        end
    end

    context 'traffic control' do
        it 'a plane cannot land if the airport is full' do
            fill(airport)
            expect{airport.allows_plane_landing(plane)}.to raise_error(RuntimeError)
        end
    end

    context 'weather conditions' do
        it 'a plane cannot take off when there is a storm brewing' do
            allow(airport).to receive(:random_weather) {'stormy'}
            airport.allows_plane_takeoff(plane)
            expect(airport.plane_status_check(plane)).to eq 'landed'
        end

        it 'a plane cannot land in the middle of a storm' do
            allow(airport).to receive(:random_weather) {'stormy'}
            airport.allows_plane_landing(plane)
            expect(airport.plane_status_check(plane)).to eq 'flying'
        end
    end

describe "The grand finale (last spec)" do
    context 'all planes can land and all planes can take off' do
        it '6 planes can land and take off' do
            queue = [Plane.new.fly!, Plane.new.fly!, Plane.new.fly!, Plane.new.fly!, Plane.new.fly!, Plane.new.fly!]
            allow(airport).to receive(:random_weather) {'sunny'}
            queue.each {|plane| airport.allows_plane_landing(plane)}
            expect(airport.landed_planes_count).to eq 6
            landed_status = []
            queue.each {|plane| landed_status << plane.flying?}
            expect(landed_status).to eq [false, false, false, false, false, false]
            queue.each {|plane| airport.allows_plane_takeoff(plane)}
            flying_status = []
            queue.each {|plane| flying_status << plane.flying?}
            expect(flying_status).to eq [true, true, true, true, true, true]
        end
    end
end
end