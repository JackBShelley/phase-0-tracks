require 'sqlite3'

def monster_index
    puts "Monster index:
  (1). Monsters by name
  (2). Monsters by location
  (3). Add Monster
  (4). Delete Monster
  (0). <---Back"
  character_input = gets.chomp

  if character_input == "1"
    monster_list_name
  elsif character_input == "2"
    p "monsters by location"
  elsif character_input == "3"
    add_monster
  elsif character_input == "4"
    delete_monster
  elsif character_input == "0"
    main_menu
  else
    puts "Please enter valid number"
    monster_index
  end
end

def monster_list_name 
  puts " "
  puts "Enter monster number for information"
  name_hash = $DATABASE.execute("SELECT name FROM monsters;")

  i = 0
  name_hash.each do |name|
    i += 1
    puts "(#{i}) #{name["name"]}"
  end
  puts "(0) <---Back"
  puts ""
  puts "Enter number for info on monster, or 0 to exit."
  monster_input = gets.chomp.to_i
  monster_name = $DATABASE.execute("SELECT name, id FROM monsters WHERE id = #{monster_input}")

  if monster_input == 0
    monster_index
  else
    puts " "
    puts "#{monster_name[0][0]}"
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


def add_monster
  puts "Enter New Monster Name"
  name = gets.chomp
  puts "Enter Monster description"
  description = gets.chomp
  puts "Enter Monster's typical environment (I.E Forest, desert, mountains, etc.)"
  location = gets.chomp

  $DATABASE.execute("INSERT INTO monsters (name, description, location) VALUES (?, ?, ?)", [name, description, location])

  puts "New Entry in Monster Index: #{name}"
  puts "Description: #{description}"
  puts "Native to the #{location}"

  monster_index
end

def delete_monster
  puts "What monster would you like to delete? 0 to go back"
  user_input = gets.chomp
  monster_names = $DATABASE.execute("SELECT name FROM monsters;")
  monster_name_array = []
  monster_names.each do |monster|
    monster_name_array << monster["name"]
  end

  if monster_name_array.include?(user_input) == true
    puts "Deleting #{user_input} from monster index..."
    puts "#{$DATABASE.execute("Select name from monsters where name = #{user_input}")}"
  elsif user_input == "0"
    monster_index
  elsif monster_name_array.include?(user_input) == false
    puts "Invalid input. Are you sure that monster exists?"
    delete_monster
  else
    puts "Invalid input"
  end
end






