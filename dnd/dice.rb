

def roll_dice
	user_input = nil
	puts "type 0 at any time to quit"
	puts " "
	puts "How many sides?"
	user_input = gets.chomp.to_i
		
	until user_input == 0
		if user_input != 0
		puts "You rolled a #{rand(user_input) + 1}"
		puts " "
		puts "How many sides?"
		user_input = gets.chomp.to_i
	end
	end
	
	main_menu
end