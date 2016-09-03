require 'sqlite3'


def roll_dice
	puts ""
	puts "Dice Roll:
(1) Roll
(2) Roll History
(3) Erase Roll History
(0) <---Back
	"
	user_input = gets.chomp

	if user_input == "1"
		roll_dice_action
	elsif user_input == "2"
		dice_roll_history
	elsif user_input == "3"
		delete_roll_history
	elsif user_input == "0"
		main_menu
	else 
		puts "Invalid input. Enter 0-2"
	end
end


def roll_dice_action
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

		add_roll = <<-SQLITE3
         INSERT INTO dice_rolls (value, dice_size) VALUES (#{roll}, #{user_input});
        SQLITE3
        $DATABASE.execute(add_roll)
		end
	end

	roll_data = $DATABASE.execute("SELECT value FROM dice_rolls")
	roll_dice


end

def dice_roll_history
	roll_history = $DATABASE.execute("SELECT * from dice_rolls order by id desc limit 11;")
	p " "
	puts "Roll History (Most recent to least)"
    roll_history.each do |roll|
    	if roll["dice_size"] > 1
    	puts "Rolled a #{roll["value"]} on a d#{roll["dice_size"]}"
    	else
    		p" "
    	end
    end
    roll_dice
end

def delete_roll_history
	$DATABASE.execute("DELETE FROM dice_rolls;")
	p "Roll history deleted"
	roll_dice
end

# rolls = $DATABASE.execute("SELECT value FROM dice_roll;")