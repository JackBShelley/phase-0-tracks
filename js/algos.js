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

//ok so I originally psuedocoded something different
//this psudeocode was written AS I was learning new javascript stuff
//create shared pair function that takes two objects as an argument
//create answer variable that defaults to false
//create if statement that compares each key pair
//if any key pair matches, give answer variable value of true
//return answer

function shared_pair(obj1, obj2){
	var answer = false;
	for (var key in obj1) {
	  if (obj1.hasOwnProperty(key))
	  	if (obj1[key] === obj2[key]){
	  		answer = true;
	  	}
}
	console.log(answer)
}


longest_word(["one", "nine", "hamburger", "toads"]);
longest_word(["superlongword", "smol", "tiny", "little"]);
longest_word(["Wow", "Ok"]);

shared_pair({name: "Steven", age: 54}, {name: "Tamir", age: 54});
shared_pair({name: "Steven", age: 26}, {name: "Tamir", age: 23});
shared_pair({name: "To7m", age: 219}, {name: "Tom", age: 2197});

