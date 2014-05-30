class Plane

	def initialize
		@flying = false
	end

	def flying?
		@flying
	end

	def landed!
		@flying = false
		self
	end

	def take_off!
		@flying = true
		self
	end

end