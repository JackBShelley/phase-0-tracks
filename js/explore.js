//create reverse function that takes a string as an argument
//just like in ruby, use .split to make the string an array
//then use reverse on the string array, and finally join it back together
//assign this all to a new variable
//print the variable


function reverse(str) {
	var str_array = str.split("").reverse().join("");
	return str_array
}

var reversed_str = reverse("reverse this string"); 

// create a true and false variable
//if theyre not equal then print the reversed string
//if they are, well you messed up.

var thing = true;
var other_thing = false;

if (thing != other_thing) {
	console.log(reversed_str);
} else {
	console.log("Something is obviously wrong here");
}