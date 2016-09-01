require_relative 'dungeon'


thing = "swag"

create_table = <<-SQLITE3
  CREATE TABLE IF NOT EXISTS characters(
	    id INTEGER PRIMARY KEY,
	    name VARCHAR(255),
	    age INT,
	    c_class VARCHAR(255)
	);
SQLITE3

$DATABASE.execute(create_table)

# #character creation method
# #ask for name, age, give class options along with description
# #short bio
# #classes give pre set inventory

def character_creation
  puts "Enter Character Name"
  name = gets.chomp
  puts "Enter Character Age"
  age = gets.chomp
  puts "Enter Character Class"
  c_class = gets.chomp

  $DATABASE.execute("INSERT INTO characters (name, age, c_class) VALUES (?, ?, ?)", [name, age, c_class])

  character = $DATABASE.execute("SELECT * FROM characters")
  character.each do |character|
  	puts "#{character['name']} is a #{character['age']} year old #{character['c_class']}"
  end
end

# #retrieve data for character name
# #retrive party data


