module Weather

	def conditions
		@weather_conditions = ['sunny', 'stormy']
	end

	def random_setting
		conditions.sample
	end

end