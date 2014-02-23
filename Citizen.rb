class Citizen

	# mother and father must be citizens too	
	# possible ideologies: :mormon, :anarchist, :democrat, :meritocrat, :ultracapitalist, :socialist, :nazi, :communist, :antisemit, :pacifist
	def initialize(mother, father, ideology)
		@Mother = mother
		@Father = father
		@Ideology = ideology
	end

	def Mother
		return @Mother
	end

	def Father
		return @Father
	end

	def Ideology
		return @Ideology
	end

end