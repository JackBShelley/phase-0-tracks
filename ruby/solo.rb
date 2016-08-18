# define class smeagol
# create initialize method with age, location, and persona
# method for location prints current location
# method to change from smeagol to gollum upon acquiring the ring
# ring location, takes argument. if ring location and smeagol are the same, he becomes gollum

class Smeagol

	def initialize(current_year, location, persona)
		age = 2430 - current_year
		@location = location
		@persona = persona
	end
end
