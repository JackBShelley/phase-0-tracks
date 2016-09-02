require 'sqlite3'

# def world_info
#   puts "World Info:
#   (1). Current realms
#   (2). Add realm
#   (3). Delete realm
#   (0). <---Back"
#   character_input = gets.chomp

#   if character_input == "1"
#     current_realms
#   elsif character_input == "2"
#     puts "add realm"
#   elsif character_input == "3"
#     puts delete realm
#   elsif character_input == "0"
#    	main_menu
#   else
#     puts "Please enter valid number"
#     monster_index
#   end
# end

# def current_realms
# 	puts "The current world is #{world_name}"
# 	puts " "
# end

def world_info
    puts "Monster index:
  (1). Monsters by name
  (2). Monsters by location
  (3). Add Monster
  (4). Delete Monster
  (0). <---Back"
  character_input = gets.chomp

  if character_input == "1"
    current_realms
  elsif character_input == "2"
    p "monsters by location"
  elsif character_input == "3"
    p "add monster"
  elsif character_input == "4"
    "delete monster"
  elsif character_input == "0"
    main_menu
  else
    puts "Please enter valid number"
    world_info
  end
end

def current_realms
  puts " "
  puts "Enter monster number for information"
  name_hash = $DATABASE.execute("SELECT name FROM realms;")

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
    world_info
  else
    puts " "
    puts "#{monster_name[0][0]}"
    puts "#{$DATABASE.execute("SELECT description FROM monsters WHERE id = #{monster_input}")[0]["description"]}"
  end

  puts " "
  puts "Press enter to check another monster, 0 to go back"

  after_input = gets.chomp

  if after_input == "0"
    world_info
  else 
    current_realms
  end
end