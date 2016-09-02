require 'sqlite3'
require_relative 'characters', 'character_creation', 'party', 'monsters', 'world'

def main_menu
	puts ""
	puts "Hello! What would you like to do?
	(1) Character information
	(2) Create new character
	(3) Party information
	(4) Monster Index
	(5) World Information
	(0) Exit
	"
	user_input = gets.chomp

	if user_input == "1"
		character_information
	elsif user_input == "2"
		p "Character creation"
	elsif user_input == "3"
		p "party information"
	elsif user_input == "4"
		p "Monster index"
	elsif user_input == "5"
		p "world information"
	elsif user_input == "0"
		abort("Thank You")
	else 
		puts "Invalid input. Enter 0-5"
	end
end

main_menu