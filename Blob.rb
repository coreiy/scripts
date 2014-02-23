class Temp_Baby

	def initialize(datamother, datafather)
		#zwischenspeichern von daten der eltern
		@DataMother = datamother
		@DataFather = datafather
	end

	def DataMother
		return @DataMother
	end

	def DataFather
		return @DataFather
	end
end

class Buerger

	@@Total_Buerger, @@total_male, @@total_female = 0,0,0

	def initialize(datamother,datafather)

		@DataMother = datamother
		@DataFather = datafather

		#ideologische ausrichtung [0..10] 0 defensiv,10 aggresiv
		@Ideology = (@DataMother[1] + @DataFather[1])/2

		####
		#print "------>Buerger #{@Id.to_s} erzeugen.\n"

		@@Total_Buerger += 1

		# values
		@Id = @@Total_Buerger
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Children = 0
		@Fertile = false
		@Money = @DataMother[1] + @DataFather[1]
		@Activ_Parent_for = 0

		#random geschlecht: "w"/"m" -> @Sex
		#total_female/male hochzählen je nach geschlecht
		if rand(0..1) < 1
			#männlich machen
			@Sex = "m"
			@Activ_Parent = false

			if @DataFather[3] > 2
				@Parent_for_Rounds = @DataFather[3] + rand(-1..1)
			else
				@Parent_for_Rounds = 2
			end			
			@@total_male += 1

		else
			#weiblich machen
			@Sex = "w"
			
			@Activ_Parent = false
			if @DataMother[3] > 2
				@Parent_for_Rounds = @DataMother[3] + rand(-1..1)
			else
				@Parent_for_Rounds = 2
			end
			@@total_female += 1
		end

		####
		#print "------>Buerger #{@Id.to_s} erzeugt.\n"
	end

	def Ideology
		return @Ideology		
	end

	def breeding

		#geschlechtsspezifisch
		if 	@Sex == "m"

			if @Activ_Parent == false and @Activ_Parent_for <= 0
				@Activ_Parent_for = @Parent_for_Rounds
				return true
			else
				return false
			end
			
		else

			if @Activ_Parent == false and @Activ_Parent_for <= 0
				@Activ_Parent_for = @Parent_for_Rounds
				return true
			else
				return false
			end
		end

	end

	def run

		####
		#print "------>Buerger #{@Id.to_s} start " + @Age.to_s + ".\n"
		@Ideology += rand(-1..1)

		####
		#print "<------Buerger #{@Id.to_s} endet " + @Age.to_s + ".\n"
		@Activ_Parent_for -= 1
		@Age += 1
		@Last_updated = Time.now.getutc
	end
end

class State

	@@Total_State = 0

	def initialize(temp_buerger)
		####
		#print "----->State #{@@Total_State+1} erzeugen\n"

		#Buerger object array erstellen
		@Buerger = []

		#Start Buerger als babies hinzufügen
		@Temp_Babies = []
		for i in 1..temp_buerger
			datamother = [0,rand(1..10),10,18]
			datafather = [0,rand(1..10),10,18]
			@Temp_Babies << Temp_Baby.new(datamother,datafather)
		end
		
		#anzahl der staaten klassenweit um 1 hochzählen
		@@Total_State += 1

		#values
		@Id = @@Total_State
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Averageideology = 0.0		
		####
		#print "----->State #{@Id.to_s} erzeugt mit #{@Buerger.size.to_s} Buergern\n"
	end

	def Buerger.size
		return @Buerger.size
	end

	def Averageideology

		#durchschnittliche Ideologie aller buerger errechnern
		@Averageideology = 0.0
		@Buerger.each {|buerger| @Averageideology += buerger.Ideology}
		@Averageideology = @Averageideology/@Buerger.size

		return @Averageideology
	end

	def addBuerger(datamother,datafather)

		#Buerger zu ObjektArray @Buerger hinzufügen inkl Datenweitergabe Mutter/Vater
		@Buerger << Buerger.new(datamother,datafather)	
	end
	
	def rendevouz
		
	end

	def run

		#####
		#print "----->State #{@Id.to_s} start " + @Age.to_s + ".\n"

		#babies am anfang jeder runde zur welt bringen
		for i in 0..@Temp_Babies.size-1
			#print "i:" + i.to_s + "@Temp_Babies.size:#{@Temp_Babies.size} << "
			self.addBuerger(@Temp_Babies[i].DataMother,@Temp_Babies[i].DataFather)
		end

		#temp babies loeschen
		for i in 0..@Temp_Babies.size
			@Temp_Babies.delete_at(i)
		end

		#jeder buerger 1mal run
		@Buerger.each {|buerger| buerger.run}

		####
		#print "----->State #{@Id.to_s} average Ideology " + self.Averageideology.to_s + "\n"
		#print "----->State #{@Id.to_s} endet " + @Age.to_s + ".\n"

		@Age += 1
		@Last_updated = Time.now.getutc
	end
end

class Planet

	@@Total_Planet = 0

	def initialize(get_X1,get_X2,get_X3,states,buerger)

		####
		#print "---->Planet #{@@Total_Planet+1} erzeugen\n"

		@Planet_X1 = get_X1 + rand(-100..100)
		@Planet_X2 = get_X2 + rand(-100..100)
		@Planet_X3 = get_X3 + rand(-100..100)

		@States = []
		for i in 1..states
			@States << State.new(buerger)
		end

		@@Total_Planet += 1

		# values		
		@Id = @@Total_Planet
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Averageideology = 0.0

		####
		#print "---->Planet #{@Id.to_s} erzeugt mit #{@States.size.to_s} Staaten\n"
	end

	def States_size
		return @States.size
	end

	def Averageideology

		@Averageideology = 0.0
		@States.each {|state| @Averageideology += state.Averageideology}
		@Averageideology = @Averageideology/@States.size

		return @Averageideology
	end

	def run

		#print "---->Planet #{@Id.to_s} start " + @Age.to_s + ".\n"

		@States.each {|state| state.run}


		#print "---->Planet #{@Id.to_s} ave.I " + self.Averageideology.to_s + "\n"
		#print "---->Planet #{@Id.to_s} endet " + @Age.to_s + ".\n"

		@Age += 1
		@Last_updated = Time.now.getutc
	end
end

class Solarsystem

	@@Total_Solarsystem = 0

	def initialize(planets,states,buerger)
		####
		#print "--->Solarsystem #{@@Total_Solarsystem+1} erzeugen\n"

		@Solarsystem_X1 = rand(-10_000..10_000)
		@Solarsystem_X2 = rand(-10_000..10_000)
		@Solarsystem_X3 = rand(-10_000..10_000)

		@Planets = []
		for i in 1..planets
			@Planets << Planet.new(@Solarsystem_X1,@Solarsystem_X2,@Solarsystem_X3,states,buerger)
		end

		@@Total_Solarsystem += 1

		# values
		@Id = @@Total_Solarsystem
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Averageideology = 0.0

		####
		#print "--->Solarsystem #{@Id.to_s} erzeugt mit #{@Planets.size.to_s} Planeten\n"
	end

	def Planets_size
		return @Planets.size
	end

	def Averageideology

		@Averageideology = 0.0
		@Planets.each {|planet| @Averageideology += planet.Averageideology}
		@Averageideology = @Averageideology/@Planets.size

		return @Averageideology
	end

	def run
		#print "--->Solarsystem #{@Id.to_s} start " + @Age.to_s + ".\n"

		@Planets.each {|planet| planet.run}
		#print "--->Solarsystem #{@Id.to_s} ave.I " + self.Averageideology.to_s + "\n"
		#print "--->Solarsystem #{@Id.to_s} endet " + @Age.to_s + ".\n"

		@Age += 1
		@Last_updated = Time.now.getutc
	end
end

class Galaxy

	@@Total_Galaxy = 0

	def initialize(solarsystems,planets,states,buerger)
		####
		#print "-->Galaxy #{@@Total_Galaxy+1} erzeugen\n"

		#ObjektArray Solarsystem erstellen und mit <planeten> Planeten füllen
		@Solarsystems = []
		for i in 1..solarsystems
			@Solarsystems << Solarsystem.new(planets,states,buerger)
		end

		@@Total_Galaxy += 1

		# values
		@Id = @@Total_Galaxy
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Averageideology = 0.0

		####
		#print "-->Galaxy #{@Id.to_s} erzeugt mit #{@Solarsystems.size.to_s} Solarsystemen\n"
	end

	def Solarsystems_size		
		return @Solarsystems.size
	end

	def Averageideology

		@Averageideology = 0.0
		@Solarsystems.each {|solarsystem| @Averageideology += solarsystem.Averageideology}
		@Averageideology = @Averageideology/@Solarsystems.size

		return @Averageideology
	end

	def run

		#print "-->Galaxy #{@Id.to_s} start " + @Age.to_s + ".\n"

		@Solarsystems.each {|solarsystem| solarsystem.run}
		#print "-->Galaxy #{@Id.to_s} ave.I " + self.Averageideology.to_s + "\n"
		#print "-->Galaxy #{@Id.to_s} endet " + @Age.to_s + ".\n"

		@Age += 1
		@Last_updated = Time.now.getutc
	end
end

class Universe

	@@Total_Universe = 0

	def initialize(galaxies,solarsystems,planets,states,buerger)

		####
		#print "->Universe #{@@Total_Universe+1} erzeugen\n"

		@Galaxies = []
		for i in 1..galaxies
			@Galaxies << Galaxy.new(solarsystems,planets,states,buerger)
		end

		@@Total_Universe += 1

		# values
		@Id = @@Total_Universe
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Averageideology = 0.0

		####
		#print "->Universe #{@Id.to_s} erzeugt mit #{@Galaxies.size.to_s} Solarsystemen\n"
	end

	def Galaxies_size
		return @Galaxies.size
	end

	def Averageideology

		@Averageideology = 0.0
		@Galaxies.each {|galaxy| @Averageideology += galaxy.Averageideology}
		@Averageideology = @Averageideology/@Galaxies.size

		return @Averageideology
	end

	def run

		#print "->Universe #{@Id.to_s} start " + @Age.to_s + ".\n" 

		@Galaxies.each {|galaxy| galaxy.run}		

		#print "->Universe #{@Id.to_s} ave.I " + self.Averageideology.to_s + "\n"
		#print "->Universe #{@Id.to_s} endet " + @Age.to_s + ".\n"

		@Age += 1
		@Last_updated = Time.now.getutc
	end
end

class UniverseHandler

	@@Total_UniverseHandler = 0

	def initialize(universes,galaxies,solarsystems,planets,states,buerger)

		####
		#print ">UniverseHandler #{@@Total_UniverseHandler+1} erzeuge\n"

		@Universes = []
		for i in 1..universes
			@Universes << Universe.new(galaxies,solarsystems,planets,states,buerger)
		end

		@@Total_UniverseHandler += 1

		# values
		@Id = @@Total_UniverseHandler
		@Born = Time.now.getutc
		@Last_updated = Time.now.getutc
		@Age = 0
		@Averageideology = 0.0

		####
		#print "<UniverseHandler #{@Id.to_s} erzeugt #{@Universes.size.to_s} Universen\n"
	end

	def Universes_size	

		return @Universes.size
	end

	def Averageideology

		@Averageideology = 0.0
		@Universes.each {|universe| @Averageideology += universe.Averageideology}
		@Averageideology = @Averageideology/@Universes.size

		return @Averageideology
	end

	def run

		####
		#print ">UniverseHandler #{@Id.to_s} start " + @Age.to_s + ".\n" 

		@Universes.each {|universe| universe.run}

		print ">UniverseHandler #{@Id.to_s} ave.I " + self.Averageideology.to_s + "\n"
		
		####
		#print "<UniverseHandler #{@Id.to_s} endet " + @Age.to_s + ".\n" 

		@Age += 1
		@Last_updated = Time.now.getutc

		####
		#print ">UniverseHandler #{@Id.to_s} @Last_updated " + @Last_updated.to_s + "\n"
	end
end

#(universes,galaxies,solarsystems,planets,states,buerger)

UH1 = UniverseHandler.new(2,2,2,5,10,1000)

while 42<1337
	UH1.run
end