puts "What's your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp

puts "Do you have children?"
children = gets.chomp

puts "What theme would you like?"
theme = gets.chomp

puts "Do you have animals?"
animal = gets.chomp

design_hash = {:name => name, :age => age, :children => children, :theme => theme, :animal => animal}
