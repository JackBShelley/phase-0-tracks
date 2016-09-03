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
    add_realm
  elsif character_input == "3"
    delete_realm
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
    puts "---------------------"
    puts "#{$DATABASE.execute("SELECT description FROM realms WHERE id = #{realm_input}")[0]["description"]}"
    puts "Landscape: #{$DATABASE.execute("SELECT landscape FROM realms WHERE id = #{realm_input}")[0]["landscape"]}"
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

def add_realm
  puts "Enter New Realm Name"
  name = gets.chomp
  puts "Enter Realm description"
  description = gets.chomp
  puts "Enter Realm's typical environment (I.E Forests, Deserts, Mountains, etc.)"
  landscape = gets.chomp
  world_id = 1
  $DATABASE.execute("INSERT INTO realms (name, description, landscape, world_id) VALUES (?, ?, ?, ?)", [name, description, landscape, world_id])

  puts "New realm in World: #{name}"
  puts "Description: #{description}"
  puts "Landscape is: #{landscape}"

  world_info
end

def delete_realm
  puts "What realm would you like to delete? 0 to go back"
  user_input = gets.chomp
  puts " "
  realm_names = $DATABASE.execute("SELECT name FROM realms;")
  realm_name_array = []
  realm_names.each do |realm|
    realm_name_array << realm["name"]
  end

  if realm_name_array.include?(user_input) == true
    puts "Deleting #{user_input} from the world..."

    delete_entry = <<-SQLITE3
      DELETE FROM realms WHERE name = "#{user_input}";
      SQLITE3

    $DATABASE.execute(delete_entry)
    world_info
  elsif user_input == "0"
    world_info
  elsif realm_name_array.include?(user_input) == false
    puts "Invalid input. Are you sure that realm exists?"
    puts " "
    delete_realm
  else
    puts "Invalid input"
    delete_realm
  end
end
