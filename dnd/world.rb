def world_info
  puts "World Info:
  (1). Current realms
  (2). Add realm
  (3). Delete realm
  (0). <---Back"
  character_input = gets.chomp

  if character_input == "1"
    puts "Current realms"
  elsif character_input == "2"
    puts "add realm"
  elsif character_input == "3"
    puts delete realm
  elsif character_input == "0"
   	main_menu
  else
    puts "Please enter valid number"
    monster_index
  end
end