//create function longest_phrase that takes one argument
//loop through the array and find length of each one
//create variable of longest and give it value of 0
//if the length of any phrase is longer than longest, assign it to longest
//return longest

function longest_word(arr){
	var longest = ("");

	for (var i = 0; i < arr.length; i++) {
		if (longest.length < arr[i].length){
			longest = arr[i]
		}
	}
	console.log(longest)
}



function shared_pair(obj1, obj2){
	for (var i = 0; i < 2; i++) {
		
		if (obj1.name === obj2.name) {
			return true;
		}
		else if (obj1.age === obj2.age) {
			return true;
		}
		else {
			return false;
		}
	}
}

longest_word(["one", "nine", "hamburger", "toads"]);
longest_word(["superlongword", "smol", "tiny", "little"]);
longest_word(["Wow", "Ok"]);


shared_pair({name: "Steven", age: 54}, {name: "Tamir", age: 54});
shared_pair({name: "Steven", age: 54}, {name: "Tamir", age: 53});
