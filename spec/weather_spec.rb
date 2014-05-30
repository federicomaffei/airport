require './lib/weather.rb'

class WeatherHolder; include Weather; end

describe Weather do

	let (:weather) {WeatherHolder.new}

	it 'can return a weather value that is sunny or stormy' do

		expect(weather.conditions).to include(weather.random_setting)

	end

end