require 'airport'
require 'plane'
 

describe Airport do

    let(:airport) { Airport.new }
    let(:plane) { Plane.new }

    def fill(airport)
        airport.set_capacity(20)
        20.times do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.checks_for_landing(plane)
        end
    end

    def flying_planes
        plane_a, plane_b, plane_c, plane_d, plane_e, plane_f = Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!
    end
  
    context 'taking off and landing' do

        it 'a plane can land' do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.checks_for_landing(plane)
            expect(airport.plane_status_check(plane)).to eq 'landed'

        end
    
        it 'a plane can take off' do
            allow(airport).to receive(:random_weather) {'sunny'}
            airport.checks_for_takeoff(plane)
            expect(airport.plane_status_check(plane)).to eq 'flying'
        end
    end
  
    context 'traffic control' do

        it 'a plane cannot land if the airport is full' do
            fill(airport)
            expect{airport.checks_for_landing(plane)}.to raise_error(RuntimeError)
        end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
        context 'weather conditions' do
            it 'a plane cannot take off when there is a storm brewing' do
                allow(airport).to receive(:random_weather) {'stormy'}
                airport.checks_for_takeoff(plane)
                expect(airport.plane_status_check(plane)).to eq 'landed'
            end
  
            it 'a plane cannot land in the middle of a storm' do
                allow(airport).to receive(:random_weather) {'stormy'}
                airport.checks_for_landing(plane)
                expect(airport.plane_status_check(plane)).to eq 'flying'
            end
        end
    end

    # # grand final
# # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# # Be careful of the weather, it could be stormy!
# # Check when all the planes have landed that they have the right status "landed"
# # Once all the planes are in the air again, check that they have the status of flying!
    describe "The grand finale (last spec)" do

        context 'all planes can land and all planes can take off' do

            it 'all planes can land' do

                plane_a, plane_b, plane_c, plane_d, plane_e, plane_f = Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_landing(plane_a)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_landing(plane_b)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_landing(plane_c)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_landing(plane_d)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_landing(plane_e)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_landing(plane_f)
                expect(airport.plane_count).to eq 6
                expect(airport.plane_status_check(plane_a)).to eq "landed"
                expect(airport.plane_status_check(plane_b)).to eq "landed"
                expect(airport.plane_status_check(plane_c)).to eq "landed"
                expect(airport.plane_status_check(plane_d)).to eq "landed"
                expect(airport.plane_status_check(plane_e)).to eq "landed"
                expect(airport.plane_status_check(plane_f)).to eq "landed"
            end

                it 'all planes can take off' do
                               
                plane_a, plane_b, plane_c, plane_d, plane_e, plane_f = Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!, Plane.new.flying!
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_takeoff(plane_a)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_takeoff(plane_b)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_takeoff(plane_c)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_takeoff(plane_d)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_takeoff(plane_e)
                allow(airport).to receive(:random_weather) {'sunny'}
                airport.checks_for_takeoff(plane_f)
                expect(airport.plane_status_check(plane_a)).to eq "flying"
                expect(airport.plane_status_check(plane_b)).to eq "flying"
                expect(airport.plane_status_check(plane_c)).to eq "flying"
                expect(airport.plane_status_check(plane_d)).to eq "flying"
                expect(airport.plane_status_check(plane_e)).to eq "flying"
                expect(airport.plane_status_check(plane_f)).to eq "flying"

            end
        end
    end
end