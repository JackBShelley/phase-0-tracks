
puts "How many employees are being processed?"
employees = gets.chomp.to_i

employees.times do

puts "What is your name?"
name  = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
year = gets.chomp.to_i

iage = 2016 - year

puts "(y/n) Our company cafeteria serves garlic bread. Should we order some for you?"
bread = gets.chomp

puts "(y/n) Would you like to enroll in the company’s health insurance?"
health = gets.chomp

p "Do you have any allergies?"
input = gets.chomp

until input == "done" or input == "sunshine"
	p "Do you have any allergies?"
	input = gets.chomp
end

if name == "Drake Cula" or name == "Tu Fang" or input == "sunshine"
	p "Definitely a vampire"
elsif iage == age && bread == "y" or health == "y"
	p "Probaby not a vampire"
elsif iage != age && bread == "n" or health == "n"
	p "Probably a vampire"
elsif iage != age && bread == "n" && health == "n"
	p "Almost certainly a vampire"
else 
	p "Results inconclusive"
end
end

	
p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."














