require 'sqlite3'


def character_creation
	puts "Create new character? (Y/N)"
	user_input = gets.chomp

	if user_input == "y" or user_input == "Y"
		  puts "Enter Character Name"
		  name = gets.chomp
		  puts "Enter Character Age"
		  age = gets.chomp
		  puts "Choose character class"
		  puts "
(1). Mage
(2). Paladin
(3). Barbarian
(4). Necromancer
(5). Bard
(6). Thief
(7). Rogue
(8). Mercenary
(9). Soldier
(10). Cleric
(11). Monk
(12). Druid
(13). Deprived"

		  class_id = gets.chomp.to_i

		  puts "Choose character race"

		  puts "	
(1). Human
(2). Elf
(3). Orc
(4). Dwarf
(5). Vampire
(6). Dark Elf
(7). Halfling"

		  race_id = gets.chomp.to_i

		  level = 0

		  $DATABASE.execute("INSERT INTO characters (name, age, level, class_id, race_id) VALUES (?, ?, ?, ?, ?)", [name, age, level, class_id, race_id])

		  puts "The character #{name} has been added to the party"
		  main_menu

	elsif user_input == "n" or user_input == "N"
		main_menu
	else 
		puts "Invalid input. Enter Y or N"
	end


end