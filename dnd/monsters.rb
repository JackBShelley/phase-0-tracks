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
    p "add monster"
  elsif character_input == "4"
    "delete monster"
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