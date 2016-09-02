require 'sqlite3'


def world_info
    puts "World Info:
  (1). Current realms
  (2). Add realm
  (3). Delete realm
  (0). <---Back"
  character_input = gets.chomp

  if character_input == "1"
    current_realms
  elsif character_input == "2"
    p "add realm"
  elsif character_input == "3"
    p "delete realm"
  elsif character_input == "0"
    main_menu
  else
    puts "Please enter valid number"
    world_info
  end
end

def current_realms
  puts " "
  puts "Enter realm number for information"
  name_hash = $DATABASE.execute("SELECT name FROM realms;")

  i = 0
  name_hash.each do |name|
    i += 1
    puts "(#{i}) #{name["name"]}"
  end
  puts "(0) <---Back"
  puts ""
  puts "Enter number for info on realm, or 0 to exit."
  realm_input = gets.chomp.to_i
  realm_name = $DATABASE.execute("SELECT name, id FROM realms WHERE id = #{realm_input}")

  if realm_input == 0
    world_info
  else
    puts " "
    puts "#{realm_name[0][0]}"
    puts "#{$DATABASE.execute("SELECT description FROM realms WHERE id = #{realm_input}")[0]["description"]}"
  end

  puts " "
  puts "Press enter to check another realm, 0 to go back"

  after_input = gets.chomp

  if after_input == "0"
    world_info
  else 
    current_realms
  end
end