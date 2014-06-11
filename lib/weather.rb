module Weather

	def conditions
		@weather_conditions = ['sunny', 'sunny', 'sunny', 'stormy']
	end

	def random_weather
		conditions.sample
	end

end