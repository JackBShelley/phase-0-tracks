# define class smeagol
# create initialize method with age, location, and persona
# about method to print location, age, and persona
#allegiance method to randomly change smeagol's alliance
# ring location, takes argument. if ring location and smeagol are the same, he becomes gollum
#catchphrase method that prints smeagol/gollum quote

class Smeagol
	
	attr_reader :persona
	attr_accessor :current_year, :location

	def initialize(current_year, location, persona)
		@current_year = current_year
		@location = location
		@persona = persona
	end
	
	def ring_location(ring_loc)
		if ring_loc == @location
			@persona = "Gollum"
		else 
			@persona = "Smeagol"
		end
	end
	
	def allegience
		num = rand(1-3)
		if num == 1
			allegience = "The hobbitses are our friends"
		else 
			allegience = "The hobbitses are evil!"
		end
	end
	
	def catchphrase
		quotes = ['We like goblinses, batses and fishes. But we hasnt tried Hobbitses before. Is it soft? Is it juicy?', 'Curse it and crush it! We hates it forever!', 'We swears to serve the master of the precious. We will swear on the...on the precious.', 'Master says to show him the way into Mordor. So good Sméagol does, master says so.', 'The Precious will be ours, once the Hobbitses are dead!','Naughty little fly, why does it cry? Caught in her web, soon youll be...eaten!']
		p quotes.sample
	end
	
	def about 
		@age = @current_year - 2430 
		p "#{@persona} is #{@age} and is currently in #{@location} and believes #{allegience}"
	end
end

#ask user for number of instances they'd like to create, 
#iterate through questions that many times
#store in array and print array at the end

def smeagol_factory
	
	smeagols = []
	
	p "How many smeagol instances would you like to make?"
	input = gets.chomp.to_i
	input.times do |i|
		p "What is the current year in Middle Earth?"
		current_year = gets.chomp.to_i
		
		p "Where is Smeagol currently?"
		location = gets.chomp
		
		p "Current persona of Smeagol?"
		persona = gets.chomp
		
		smeagol = Smeagol.new(current_year, location, persona)
		
		smeagols << smeagol.about
	end
	p smeagols
end

smeagol_factory
