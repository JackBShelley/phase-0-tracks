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
  
end