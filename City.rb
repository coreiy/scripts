class City

	def initialize(citizens)
		@Citzens = citizens
	end

	def Citizens
		return @Citizens
	end

	def AverageIdeology
		@AverageIdeology = 0
		@Citizens.each { |citizen| 
			@AverageIdeology += citizen.Ideology
		}
		@AverageIdeology /= @AverageIdeology / @Citizens.size
		return @AverageIdeology
	end
	
end