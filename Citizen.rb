class Citizen < Person

	# mother and father must be citizens too	
	def initialize(mother, father)
		@Mother = mother
		@Father = father
		@Ideology = (father.Ideology + mother.Ideology) / 2
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