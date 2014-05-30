require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 50

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes ||= []
	end

	def plane_count
		@planes.count
	end

	def set_capacity(capacity)
		@capacity = capacity
	end

	def checks_for_landing(plane)
		if !bad_weather?
			plane.landed!
			raise RuntimeError if full?
			@planes << plane
		else plane.flying!
		end
	end

	def checks_for_takeoff(plane)
		if !bad_weather?
			plane.flying!
			@planes.delete(plane)
		else plane.landed!
		end
	end

	def full?
		plane_count == @capacity
	end

	def bad_weather?
		if self.random_weather == 'stormy'
			true
		end
	end

	def plane_status_check(plane)
		plane.return_state
	end

end