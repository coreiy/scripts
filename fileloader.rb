require "open-uri"

class Loader
	def load(url,filename,imagenbr,filetype)

			for i in 1..imagenbr

				File.open( filename + "_" + i.to_s + filetype, 'wb') do |fo|

	  				if i< 10

	  					fo.write open(url + "0" + i.to_s + filetype).read 

	  				else
	  					fo.write open(url + i.to_s + filetype).read
	  				end
				end

			end

	end

end

l = Loader.new()
l.load(url,"duo89",1,".jpg")

