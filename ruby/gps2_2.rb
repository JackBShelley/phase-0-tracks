# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # use .split to seperate string items, 
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

#create the hash with items added to it
def create_list(items) 
	list = {}
	items = items.split
	items.each do |i|
		list[i] = 1
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

list = create_list("carrots apples cereal pizza bananas icecream")
add_item(list, 'peaches', 3)
delete_item('carrots', list)
update_quantity('peaches', 5, list)
print_list(list)
