#take string and .split for " "
#switch index positions and then .join
#use .tr with the entire alphabet as the first string and the switched alphabet as the second
#.tr does not including capitals unless I modify the string so I just downcased the string, converted it, and then capitalized it.


def fake_name(string)
	
	string_array = string.split(" ")
	string_array.insert(0, string_array.delete_at(1))
	string_array = string_array.join(' ')

	string_array = string_array.downcase.tr('bcdfghjklmnpqrstvwxyzaeiou', 'cdfghjklmnpqrstvwxyzbeioua').split(' ')
	
	string_array[0].capitalize!
	string_array[1].capitalize!
	string_array = string_array.join(' ')
 
end


fake_name("Jack Shelley")