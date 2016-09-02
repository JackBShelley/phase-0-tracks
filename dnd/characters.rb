require 'sqlite3'

def character_information
	puts ""
	puts "Character Information:
	(1) Class Information
	(2) Race Information
	(3) Current Characters
	(0) <---Back
	"
	user_input = gets.chomp

	if user_input == "1"
		p "class info"
	elsif user_input == "2"
		p "race info"
	elsif user_input == "3"
		p "current characters"
	elsif user_input == "0"
		main_menu
	else 
		puts "Invalid input. Enter 0-3"
	end
end