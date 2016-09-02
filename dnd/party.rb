require 'sqlite3'


def party_info
		puts ""
	puts "Party Information:
	(1) Current Party
	(2) Delete party member
	(0) <---Back
	"
	user_input = gets.chomp

	if user_input == "1"
		current_party
	elsif user_input == "2"
		p "delete party member"
	elsif user_input == "0"
		main_menu
	else 
		puts "Invalid input. Enter 0-2"
	end
end


def current_party
	party = <<-SQLITE3
      SELECT characters.name, characters.age, classes.name, races.name FROM characters LEFT OUTER JOIN classes ON classes.id = class_id LEFT OUTER JOIN races ON races.id = race_id;
      SQLITE3
	puts "The party currently consists of..."
	puts " "
	party_array = $DATABASE.execute(party)
	party_array.each do |character|
		puts "#{character[0]}, a #{character[1]} year old #{character[3]} #{character[2]}"
	end
	puts " "
    puts "Press enter to continue"
    pause = gets.chomp

    party_info
end


