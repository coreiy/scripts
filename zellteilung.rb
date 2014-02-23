

















	
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
		
						
						
					## need def add_cell(n,name,mass,min_mass,death_age,daughters)
					##wenn cellmasse min ... dann teile dich und gib die vererbungsmerkmale zurück
					#print temp.to_s + "\n"
					@cells.delete_at(rand(0..@cells.size-1).to_i)
					@cells[i].delete
					@cells_killed += 1
					print " -->  " +@cells[i].get_daughters.to_s + " x " + temp[4].to_s + "g \n"
					print "########\nZellen insgesamt: "+@cells.size.to_s + " !!!\n"
					print "\n" + @cells[i].get_mass.to_s + "g "
					print "\nR"+@time.to_s+" "+i.to_s+"/"+@cells.size.to_s + "\n"
					print "Zellen bisher abgetoetet: " +@cells_killed.to_s + " mit "+@prokill.to_s+"!!!\n########\n\n"
					print "|"
					self.add_cell(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6])
					temp = @cells[i].devision
				@cells[i].delete
				@cells[i].grow(rand(1..3))
				break
				break
				end
				end
				for k in (0..temp_cells_size_half)
				if @cells[i].get_mass >= @cells[i].get_min_mass*@cells[i].get_daughters
				print "killed "+temp_cells_size_half.to_s + "\n"
				print "loesche " + @cells[i].get_name + "\n"
				self.kill_cells
				temp_cells_size_half = @cells.size/2
			## Cell.def initialize	(name,mass,min_mass,death_age,daughters)
			##wenn cellalter älter als todesalter lösche zelle
			#@cells[rand(0..@cells.size-1)].delete
			#füttern
			#jede zelle auf teilung testen
			@cells << Cell.new(gen,name,mass,min_mass,death_age,daughters)
			@cells[i].age_plus
			@daughters = 2
			@daughters = daughters + zufall3  
			@death_age = 1
			@death_age = death_age.to_i + zufall2	
			@min_mass  = 10
			@min_mass  = min_mass.to_i + zufall1
			else
			end
			end
			end
			end
			for i in (0..@cells.size-1)
			for i in (0..@cells.size-1)
			if @cells.size >= @max_cells
			if @cells[i].get_age  >= @cells[i].get_death_age
			n.times{
			}
		#
		## töte 30% aller zellen ab
		## zufall vererbung		min_mass
		## zufall vererbung teodesalter
		##natural selection
		##zufalls vererbung nachkommen	
		#10mal füttern auf teilung testen
		#end
		#end
		#print  "|"+@name + "-> "+ essen.to_s+""
		#print "---" +@cells.size.to_s + " Zellen insgesamt \n"
		#print "Füge " + @name +" --> " + n.to_s + " Zellen hinzu\n"
		#print @name + " .get_age return "+ @age.to_s+"\n"
		#print @name + ".get_min_mass return " + @min_mass.to_s + "\n"
		#print @name +".delete\n"
		#print @name +".get_mass return "+@mass.to_s+"\n"
		#töten
		#while @cells.size >= 5000
		#while @cells.size >= @max_cells
		@@total_cells += 1
		@@total_cells -= 1
		@age += 1
		@age = 0
		@cells = Array.new
		@cells_killed = 0
		@gen = gen +1
		@mass += essen
		@mass = mass
		@max_cells = 1000
		@name = ":|Generation:"+@gen.to_s+" (MinMass: "+ @min_mass.to_s + "),(DeathAge: "+@death_age.to_s+"),(Daughters: "+@daughters.to_s+")|"
		@name = name
		@prokill = 0.50
		@time += 1
		@time = 0
		else
		else
		else
		end
		end
		end
		end
		end
		end
		end
		end
		for i in (0..@cells.size-1)
		for j in (0..10)
		if  min_mass + zufall1 >= 10
		if @cells.size >= @max_cells
		if daughters + zufall3 >= 1
		if death_age + zufall2 >= 1
		if n > 0
		print @name
		print @name + "\n"
		print @name +".run START "+@time.to_s+"\n"
		print @name +".run STOP \n" + @time.to_s+"\n"
		return  @daughters, @gen ,@name , @mass/@daughters , @min_mass, @death_age, @daughters
		return @age
		return @daughters
		return @death_age
		return @mass 		
		return @min_mass
		return @name
		while 42 < 1337
		zufall1 = rand(-5..5)
		zufall2 = rand(-10..10)
		zufall3 = rand(-2..2)
	# Zele teilen
	#getter: Maße
	#getter: minimal benötigte masse für zellteilung
	#Schale 1 Schritt altern
	#Schale erstellen
	#Schallen.array-> Zellen n Zellen hinzufügen
	#Zelle erstellen
	#Zelle wachsen
	@@total_cells = 0 
	daughters = rand(1..3)
	deathage = rand(-20..20)+50
	def add_cell(n,gen,name,mass,min_mass,death_age,daughters)
	def age_plus
	def delete
	def devision
	def get_age
	def get_daughters
	def get_death_age
	def get_mass
	def get_min_mass
	def get_name
	def grow(essen)
	def initialize	(gen,name,mass,min_mass,death_age,daughters)
	def initialize(name)
	def kill_cells
	def run(rounds_till_kill_cells)
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end 
	menge = rand(1..3)
	min_masse = rand(-20..20)+100
	s1.add_cell(menge,0,startname,startmasse,min_masse,deathage,daughters)
	s1.run(2)
	startmasse = rand(-10..10)+50
	startname = "|("+min_masse.to_s+")("+deathage.to_s+")("+daughters.to_s+")|"
### add cell menge, startname, startmasse,min_masse,deathage,daughters
##############################Zelle###########################
#########################Schale #############################
######################Script start###############################
$min_mass_for_cell_divison = 100
class Cell
class Plate
end
end
end
end
for i in (0..2)
s1 = Plate.new("Schale 1")
while 42<1337