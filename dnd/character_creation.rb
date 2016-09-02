def character_creation
	puts "Create new character? (Y/N)"
	user_input = gets.chomp

	if user_input == "y" or user_input == "Y"
		puts "Creating new character"
	elsif user_input == "n" or user_input == "N"
		main_menu
	else 
		puts "Invalid input. Enter Y or N"
	end
end