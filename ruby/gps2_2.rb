# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # use .split to seperate string items, 
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

#create the hash with items added to it

def create_list(items = {}) 
	list = {}
	if items != {}
		items = items.split
		items.each do |i|
			list[i] = 1
		end
	end
	p list
end

# Method to add an item to a list
# input: item name and optional quantity
# steps: (item, quantity)
# output: the hash with new items added

def add_item(list, item, quantity = 1)
	list[item] = quantity
	p list
end

# Method to remove an item from the list
# input: item
# steps: take item as argument for deleting item
# output: new hash

def delete_item(item, list)
	list.delete(item)
	p list
end

# Method to update the quantity of an item
# input: item, new quantity
# steps: 
# output: new hash with updated quantity

def update_quantity(item, new_quantity, list)
	list[item] = new_quantity
	p list
end

#iterate through hash contents and print items and quantities

# Method to print a list and make it look pretty
# input: list
# steps: 
# output: string of list items in sentence

def print_list(list)
	list.each do |key, value|
		p "There are #{value} #{key}"
	end
end

list = create_list()
add_item(list, 'Lemonade', 2)
add_item(list, 'Tomatoes', 3)
add_item(list, 'Onions', 1)
add_item(list, 'Ice Cream', 4)
delete_item('Lemonade', list)
update_quantity('Ice Cream', 1, list)
print_list(list)

#psuedocode definitely has to be detailed and thought out, yet simple at the same time. It makes things way easier in the end...
#I'm not sure I entirely understand the question, but I'll do my best to answer it. The main reason I used a hash instead of an array is because with a hash I can store the quantity with the item name. I couldnt do that with an array.
#A method can return a lot of things. A variable, a string, a boolean, really anything.
#Also anything, same as above. As long as your code in the method works with it! 
#You can assign a method's output to a variable, which is what I did above.
#This challenge definitely helped with how to pass info between methods as well as what methods can actually take as arguments. 
