#ask for user input, variables = gets.chomp. 
#convert to appropriate data type
puts "What's your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "I have children? (T/F)"
children = gets.chomp

puts "What theme would you like?"
theme = gets.chomp

puts "I you have animals? (T/F)"
animal = gets.chomp
children == "t" ? (children = TRUE) : (children = false)
animal == "t" ? (animal = TRUE) : (animal = false)

#create hash using symbols as keys and variables as values

design_hash = {:name => name, :age => age, :children => children, :theme => theme, :animal => animal}

#ask if user wants to change data
#if they say "none", skip and print data
#if they say correct key then update that key with new value

puts "Would you like to update any values?"
input = gets.chomp.to_sym


if input == :none
	p design_hash
else 
	puts "What is the new value?"
  	design_hash[input] = gets.chomp
	p design_hash
end
