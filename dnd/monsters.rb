require 'sqlite3'

def monster_index
    puts "Monster index:
  (1). Monsters by name
  (2). Monsters by location
  (3). Add Monster
  (4). Delete Monster
  (5). Edit monster info
  (0). <---Back"
  character_input = gets.chomp

  if character_input == "1"
    monster_list_name
  elsif character_input == "2"
    monster_list_location
  elsif character_input == "3"
    add_monster
  elsif character_input == "4"
    delete_monster
  elsif character_input == "5"
    edit_monster_info
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
  puts " "
  monster_names = $DATABASE.execute("SELECT name FROM monsters;")
  monster_name_array = []
  monster_names.each do |monster|
    monster_name_array << monster["name"]
  end

  if monster_name_array.include?(user_input) == true
    puts "Deleting #{user_input} from monster index..."

    delete_entry = <<-SQLITE3
      DELETE FROM monsters WHERE name = "#{user_input}";
      SQLITE3

    $DATABASE.execute(delete_entry)

  elsif user_input == "0"
    monster_index
  elsif monster_name_array.include?(user_input) == false
    puts "Invalid input. Are you sure that monster exists?"
    puts " "
    delete_monster
  else
    puts "Invalid input"
    delete_monster
  end
end

def monster_list_location
  puts " "
  puts "Enter monster number for information"

  monster_locations_forest = <<-SQLITE3
     SELECT name FROM monsters WHERE
     location="Forests";
    SQLITE3
  forest_monsters = $DATABASE.execute(monster_locations_forest)

  monster_locations_mountain = <<-SQLITE3
     SELECT name FROM monsters WHERE
     location="Mountains";
    SQLITE3
  mountain_monsters = $DATABASE.execute(monster_locations_mountain)

  monster_locations_desert = <<-SQLITE3
     SELECT name FROM monsters WHERE
     location="Deserts";
    SQLITE3
  desert_monsters = $DATABASE.execute(monster_locations_desert)

  monster_locations_dungeon = <<-SQLITE3
     SELECT name FROM monsters WHERE
     location="Dungeons";
    SQLITE3
  dungeon_monsters = $DATABASE.execute(monster_locations_dungeon)

  monster_locations_city = <<-SQLITE3
     SELECT name FROM monsters WHERE
     location="City";
    SQLITE3
  city_monsters = $DATABASE.execute(monster_locations_city)


  puts "
Forest Monsters
----------------"
  forest_monsters.each do |name|
    puts "#{name["name"]}"
  end

  puts "
Mountains Monsters
----------------"
 mountain_monsters.each do |name|
    puts "#{name["name"]}"
  end

  puts "
Desert Monsters
----------------"
  desert_monsters.each do |name|
    puts "#{name["name"]}"
  end

  puts "
Dungeon Monsters
----------------"
  dungeon_monsters.each do |name|
    puts "#{name["name"]}"
  end

  puts "
City Monsters
----------------"
  city_monsters.each do |name|
    puts "#{name["name"]}"
  end


  puts " "
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

def edit_monster_info
  puts "What monster would you like to edit? 0 to go back"
  user_input = gets.chomp
  puts " "
  monster_names = $DATABASE.execute("SELECT name FROM monsters;")
  monster_name_array = []
  monster_names.each do |monster|
  monster_name_array << monster["name"]
  end

  if monster_name_array.include?(user_input) == true
    puts "What about the #{user_input} would you like to edit? (name, description,location)"
    edit_input = gets.chomp
    puts "What is your new value for #{edit_input}"
    new_value = gets.chomp

    edit_entry = <<-SQLITE3
      UPDATE monsters SET "#{edit_input}"="#{new_value}" WHERE name = "#{user_input}";
      SQLITE3

    $DATABASE.execute(edit_entry)

    p "#{user_input} has been updated"

    monster_index

  elsif user_input == "0"
    monster_index
  elsif monster_name_array.include?(user_input) == false
    puts "Invalid input. Are you sure that monster exists?"
    puts " "
    edit_monster_info
  else
    puts "Invalid input"
    edit_monster_info
  end
end



