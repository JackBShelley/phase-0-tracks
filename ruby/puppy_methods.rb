class Puppy

	def initialize 
		p "Initializing new puppy instance ..."
	end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

 	def speak(int)
  	int.times do |i|
  		p "Woof"
  	end
  	end

  	def roll_over
  		p "*rolls over*"
  	end

  	def dog_years(int)
  		p int * 7
 	end

 	def play_dead 
 		p "*plays dead*"
 	end
end

class Robot
	def initialize 
		p "Initializing new robot instance ..."
	end
	
	def speak 
		p "Beep Boop"
	end

	def grab_item(item)
		p "Robot grabs #{item}"
	end
end

robot_array = []

50.times do |i|
	robot = Robot.new
	robot_array << robot
end

robot_array.each do |i|
	i.speak
	i.grab_item("ball")
end


# fido = Puppy.new
# fido.fetch("ball")
# fido.speak(3)
# fido.roll_over
# fido.dog_years(5)
# fido.play_dead
