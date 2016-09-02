
#require sqlite, other ruby files
require 'sqlite3'



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



def monster_index
    puts "Monster index:
  (1). Monsters by name
  (2). Monsters by location
  (0). <---Back"
  character_input = gets.chomp

  if character_input == "1"
    monster_list_name
  elsif character_input == "2"
    p "here's some other stuff"
  elsif character_input == "0"
    main_menu
  else
    puts "Please enter valid number"
    character_info
  end
end


def monster_list_name
  puts "Enter monster number for information"
  c_name_hash = $DATABASE.execute("SELECT monster_name FROM monsters;")

  i = 0
  c_name_hash.each do |name|
    i += 1
    puts "(#{i}) #{name["monster_name"]}"
  end
  puts "(0) <---Back"
  puts ""
  puts "Enter number for info on monster, or 0 to exit."
  monster_input = gets.chomp.to_i
  monster_name = $DATABASE.execute("SELECT monster_name, id FROM monsters WHERE id = #{monster_input}")
  puts "#{monster_name[0]["monster_name"]}:"

  if monster_input == 0
    monster_index
  else
    puts "#{$DATABASE.execute("SELECT description FROM monsters WHERE id = #{monster_input}")[0]["description"]}"
  end
  
  puts " "
  puts "Press enter to check another monster, 0 to go back"

  after_input = gets.chomp

  if after_input == "0"
    monster_index
  else 
    monster_list_name
  end
end


# #retrieve data for character name
# #retrive party data

def print_party_info
	$DATABASE.execute("")
end

require_relative 'dungeon'

create_table = <<-SQLITE3
  CREATE TABLE IF NOT EXISTS characters(
	    id INTEGER PRIMARY KEY,
	    name VARCHAR(255),
	    age INT,
	    c_class VARCHAR(255)
	);
SQLITE3


create_classes = <<-SQLITE3
  CREATE TABLE IF NOT EXISTS classes(
	    id INTEGER PRIMARY KEY,
	    class_name VARCHAR(255),
	    description VARCHAR(255)
	);
SQLITE3

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
  puts " "

  main_menu
end

def character_info
	puts "Character information:
	(1). Character classes
	(2). Current characters
	(0). <---Back"
	character_input = gets.chomp

	if character_input == "1"
		puts ""
		print_class_info
	elsif character_input == "2"
		p "here's all the other stuff"
	elsif character_input == "0" 
		main_menu
	else
		puts "Please enter valid number"
		character_info
	end
end

def print_class_info
	puts "Enter class number for information"
	c_name_hash = $DATABASE.execute("SELECT class_name FROM classes;")

	i = 0
	c_name_hash.each do |name|
		i += 1
		puts "(#{i}) #{name["class_name"]}"
	end
	puts "(0) <---Back"
	puts ""
	puts "Enter number for info on class, or 0 to exit."
	class_input = gets.chomp.to_i
	class_name = $DATABASE.execute("SELECT class_name, id FROM classes WHERE id = #{class_input}")
	puts "#{class_name[0]["class_name"]}:"

	if class_input == 0
		character_info
	else 
		puts "#{$DATABASE.execute("SELECT description FROM classes WHERE id = #{class_input}")[0]["description"]}"
	end
	puts " "
	puts "Press enter to check another class, 0 to go back"
	after_input = gets.chomp
	if after_input == "0"
		character_info
	else
		print_class_info
	end
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
		character_info
	elsif  menu_input == "3"
		puts "Print party information..."
	elsif  menu_input == "4"
		monster_index
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