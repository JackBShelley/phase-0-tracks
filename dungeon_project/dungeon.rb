
#require sqlite, other ruby files
require 'sqlite3'
require_relative 'character'


#create sqlite database for user info
#store name, age, class, inventory, recent actions
#class, inventory, and recent actions relate to other tables
# #character creation method
# #ask for name, age, give class options along with description
# #short bio
# #classes give pre set inventory


$DATABASE = SQLite3::Database.new("dungeon.db")
$DATABASE.results_as_hash = true

create_table = <<-SQLITE3
  CREATE TABLE IF NOT EXISTS characters(
	    id INTEGER PRIMARY KEY,
	    name VARCHAR(255),
	    age INT,
	    c_class VARCHAR(255)
	);
SQLITE3

$DATABASE.execute(create_table)

def character_creation
  puts "Enter Character Name"
  name = gets.chomp
  puts "Enter Character Age"
  age = gets.chomp
  puts "Enter Character Class"
  c_class = gets.chomp

  $DATABASE.execute("INSERT INTO characters (name, age, c_class) VALUES (?, ?, ?)", [name, age, c_class])

  puts "#{name} is a #{age} year old #{c_class}"
  puts "You character #{name} has been added to the party."
end

# #retrieve data for character name
# #retrive party data

def print_character_info
	puts "Character information:
	(1). Character classes
	(2). Current characters
	(0). <---Back"
	character_input = gets.chomp

	if character_input == "1"
		p "here's all the stuff"
	elsif character_input == "2"
		p "here's all the other stuff"
	elsif character_input == "0"
		main_menu
	else
		puts "Please enter valid number"
	end
end

def print_party_info
	$DATABASE.execute("")
end

def print_class_info(class_name, description)

end

create_classes = <<-SQLITE3
  CREATE TABLE IF NOT EXISTS classes(
	    id INTEGER PRIMARY KEY,
	    class_name VARCHAR(255),
	    description VARCHAR(255)
	);
SQLITE3

$DATABASE.execute(create_classes)

#allow user to select actions
def main_menu
	puts "Hello! What would you like to do?
	(1) Create new character
	(2) Character information
	(3) Party information
	(4) Monster Index
	(5) World Information
	(0) Exit
	"

	menu_input =  gets.chomp

	if menu_input == "1"
		puts "Beginning character creation..."
		character_creation
	elsif  menu_input == "2"
		print_character_info
	elsif  menu_input == "3"
		puts "Print party information..."
	elsif  menu_input == "4"
		puts "Starting monster index..."
	elsif  menu_input == "5"
		puts "Printing world information..."
	elsif  menu_input == "0"
		abort('Thank you!')
	else 
		puts "Please enter valid number"
	end

end

main_menu


#dice method
#roll d4, d6, d8, d10, d12, d20 (allow multiple rolls and print message)
#store last roll



#allow character action input, store last 3 actions
