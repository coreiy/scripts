class IdeologicSystem

	def averageIdeology(systems)
		@averageIdeology = 0.0
		@systems.each {|system| @averageIdeology += system.Ideology}
		@averageIdeology = @averageIdeology/@systems.size
		return @averageIdeology
	end

end