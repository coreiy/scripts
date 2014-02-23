class IdeologicSystem

	def initialize(systems)
		@Systems = systems
	end

	def AverageIdeology
		@AverageIdeology = 0.0
		@Systems.each { |system| 
			@AveragyIdeology += system.AverageIdeology
		}
		@AverageIdeology /= @Systems.size
		return @AverageIdeology
	end

end