class Plane

	def initialize
		@flying = false
	end

	def flying?
		@flying
	end

	def land!
		@flying = false
		self
	end

	def fly!
		@flying = true
		self
	end

	def return_state
		@flying == true ? 'flying' : 'landed'
	end

end