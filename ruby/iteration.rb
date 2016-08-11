array_1 = [1,2,3]
hash_1 = {:shoes => "red", :shirts => "blue", :pants => "yellow"}


p array_1
array_1.each do |i|
	array_1[i-1] = array_1[i-1] + 1
end
p array_1


p array_1
array_1.map! do |i|
	array_1[i-1] + 2
end
p array_1


p hash_1
hash_1.each do |key, value|
	hash_1[key] = "dark " + value
end
p hash_1

array_2 = [1,2,3,4,5,6]

hash_2 = {"A" => 1, "B" => 2, "C" => 3}


p array_2
array_2.delete_if{|i| i <= 3}
p array_2

p hash_2
hash_2.delete_if{|key, value| value < 2}
p hash_2


p array_2
array_2.keep_if{|i| i <= 3}
p array_2

p hash_2
hash_2.keep_if{|key, value| value < 2}
p hash_2

p array_2
array_2.reject! {|i| i < 3 }
p array_2

p hash_2
hash_2.reject!{|key, value| value > 1}
p hash_2

p array_2
array_3 = array_2.drop_while {|i| i < 3 }
p array_3


#Our plan was to iterate through the hash until the condition key = "C" was met, until then delete all values that are not "C". It just seemed to be iterating through the entire hash regardless of it being true of false.

# hash_2.each do |key, value|
# 	if hash_2[key] == "C"
# 	 	break
# 	else
# 		hash_2[key] = 6
# 	end
# 	p hash_2
# end	















