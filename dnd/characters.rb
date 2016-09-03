require 'sqlite3'

def character_information
	puts ""
	puts "Character Information:
	(1) Class Information
	(2) Race Information
	(3) Current Characters
	(0) <---Back
	"
	user_input = gets.chomp

	if user_input == "1"
		class_info
	elsif user_input == "2"
		race_info
	elsif user_input == "3"
		current_characters
	elsif user_input == "0"
		main_menu
	else 
		puts "Invalid input. Enter 0-3"
	end
end

def class_info
puts " "
  puts "Enter class number for information"
  name_hash = $DATABASE.execute("SELECT name FROM classes;")

  i = 0
  name_hash.each do |name|
    i += 1
    puts "(#{i}) #{name["name"]}"
  end
  puts "(0) <---Back"
  puts ""
  puts "Enter number for info on class, or 0 to exit."
  class_input = gets.chomp.to_i
  class_name = $DATABASE.execute("SELECT name, id FROM classes WHERE id = #{class_input}")

  if class_input == 0
    character_information
  else
    puts " "
    puts "#{class_name[0][0]}"
    puts "#{$DATABASE.execute("SELECT description FROM classes WHERE id = #{class_input}")[0]["description"]}"
  end

  puts " "
  puts "Press enter to check another class, 0 to go back"

  after_input = gets.chomp

  if after_input == "0"
    character_information
  else 
    class_info
  end
end

def race_info
puts " "
  puts "Enter race number for information"
  name_hash = $DATABASE.execute("SELECT name FROM races;")

  i = 0
  name_hash.each do |name|
    i += 1
    puts "(#{i}) #{name["name"]}"
  end
  puts "(0) <---Back"
  puts ""
  puts "Enter number for info on a race, or 0 to exit."
  race_input = gets.chomp.to_i
  race_name = $DATABASE.execute("SELECT name, id FROM races WHERE id = #{race_input}")

  if race_input == 0
    character_information
  else
    puts " "
    puts "#{race_name[0][0]}"
    puts "#{$DATABASE.execute("SELECT description FROM races WHERE id = #{race_input}")[0]["description"]}"
  end

  puts " "
  puts "Press enter to check another race, 0 to go back"

  after_input = gets.chomp

  if after_input == "0"
    character_information
  else 
    race_info
  end
end

def current_characters
	party = <<-SQLITE3
      SELECT characters.name, characters.age, classes.name, races.name FROM characters LEFT OUTER JOIN classes ON classes.id = class_id LEFT OUTER JOIN races ON races.id = race_id;
      SQLITE3
	puts "The current characters are..."
	puts " "
	party_array = $DATABASE.execute(party)
	party_array.each do |character|
		puts "#{character[0]}, a #{character[1]} year old #{character[3]} #{character[2]}"
	end
	puts " "
    puts "Press enter to continue"
    pause = gets.chomp

    character_information
end
