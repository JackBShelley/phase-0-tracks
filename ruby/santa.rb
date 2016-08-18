class Santa
	
	attr_reader :age, :ethnicity
	attr_accessor :gender

	def initialize(gender, ethnicity)
		@gender =  gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
		p "Initializing Santa instance ..."
	end

	def speak 
		p "Ho, ho, ho! Haaaappy holidays!" 
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie}!" 
	end
	
	def about 
		puts "gender: #{@gender}"
		puts "ethnicity: #{@ethnicity}"
		# puts "reindeer ranking:#{@reindeer_ranking}"	
		puts "age: #{@age}"
	end
	
	def celebrate_birthday
		@age = @age + 1
	end
	
	def get_mad_at(reindeer)
		@reindeer_ranking.insert(-1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer))) 
	end
	
end

santa = Santa.new("male", "elvish")
santa.about
santa.celebrate_birthday
santa.get_mad_at("Rudolph")
santa.gender = 'female'
santa.about
santa.ethnicity
santa.age


# santas = []

# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# example_age = Random.new.rand(0..140) 