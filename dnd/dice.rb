require 'sqlite3'

def roll_dice
	user_input = nil
	puts "type 0 at any time to quit"
	puts " "
	puts "How many sides?"
	user_input = gets.chomp.to_i
		
	until user_input == 0
		if user_input != 0
		roll = rand(user_input) + 1
		puts "You rolled a #{roll}"
		puts " "
		puts "How many sides?"
		user_input = gets.chomp.to_i

		add_role = <<-SQLITE3
         INSERT INTO dice_rolls (value) VALUES (#{roll});
        SQLITE3
        $DATABASE.execute(add_role)

		end
	end

	roll_data = $DATABASE.execute("SELECT value FROM dice_rolls")

	if roll_data.length > 10
		delete_roll = <<-SQLITE3
         DELETE FROM dice_rolls WHERE id>10
         SQLITE3
        $DATABASE.execute(delete_roll)
        main_menu
    else 
    	main_menu
    end


end


# rolls = $DATABASE.execute("SELECT value FROM dice_roll;")