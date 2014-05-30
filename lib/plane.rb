class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def landed!
		@flying = false
		self
	end

	def flying!
		@flying = true
		self
	end

	def return_state
		@flying == true ? 'flying' : 'landed'
	end

end