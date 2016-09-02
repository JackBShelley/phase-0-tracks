require 'sqlite3'
require_relative 'characters' 
require_relative 'character_creation'
require_relative 'party'
require_relative 'monsters'
require_relative 'world'

$DATABASE = SQLite3::Database.new("dungeon.db")
$DATABASE.results_as_hash = true

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
		character_creation
	elsif user_input == "3"
		party_info
	elsif user_input == "4"
		monster_index
	elsif user_input == "5"
		p "world information"
	elsif user_input == "0"
		abort("Thank You")
	else 
		puts "Invalid input. Enter 0-5"
	end
end

main_menu