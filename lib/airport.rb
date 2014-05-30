class Airport

	def initialize
		@planes ||= []
	end

	def plane_count
		@planes.count
	end

	def allows_landing_to(plane)
		@planes << plane
	end

	def requests_takeoff_to(plane)
		@planes.delete(plane)
	end

	

end