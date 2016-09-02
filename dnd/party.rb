require 'sqlite3'


def party_info
		puts ""
	puts "Party Information:
	(1) Current Party
	(2) Delete party member
	(0) <---Back
	"
	user_input = gets.chomp

	if user_input == "1"
		p "current party info"
	elsif user_input == "2"
		p "delete party member"
	elsif user_input == "0"
		main_menu
	else 
		puts "Invalid input. Enter 0-2"
	end
end
