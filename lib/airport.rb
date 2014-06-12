require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 50

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@flying_planes ||= []
		@landed_planes ||= []
	end

	def plane_count
		@landed_planes.count
	end

	def set_capacity(capacity)
		@capacity = capacity
	end

	def allows_plane_landing(plane)
		!bad_weather? ? plane.land! : plane.fly!
		raise RuntimeError if full?
		@landed_planes << plane if !@landed_planes.include?(plane)
	end

	def allows_plane_takeoff(plane)
		!bad_weather? ? plane.fly! : plane.land!
		@landed_planes.delete(plane)
		@flying_planes << plane
	end

	def full?
		plane_count == @capacity
	end

	def bad_weather?
		random_weather == 'stormy'
	end

	def plane_status_check(plane)
		plane.return_state
	end

end