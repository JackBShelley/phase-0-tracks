console.log("This script is running.");

imagediv = document.getElementById("image");

function changeToGIF(event){
  console.log(event)
  event.target.style.border = "2px solid black";
  event.target.style.display = "none";

  var newimage = document.createElement("img");
  newimage.src = "cat.gif";
  imagediv.appendChild(newimage);
}

var maindiv = document.getElementById("about-my-pet");
var children = maindiv.children;

for (var i = 0; i < children.length; i++) {
  children[i].style.border = "2px solid red";
}

//var para = document.createElement("p");
var para = document.getElementById("firstpara");
var node = document.createTextNode("JavaScript of adding this text.");
para.appendChild(node);

var photo = document.getElementById("flowers");
photo.addEventListener("click", changeToGIF);

console.log(children);

