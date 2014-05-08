//logic for rotating images goes here:

//set an empty var for currentImage:

var currentPhoto = 0;
//reach into DOM and select elements you will be playing with:
var image = document.querySelector("#imageSwap");
var div = document.querySelector("#images");

// pull up a list of all photos from a given event from active record in an array. 
var arrayPhotos = gon.arrayPhotos;

//TODO: pull up a list of images that are ordered first to last by id. This helps order image streaming by time.
// make sure the list is ordered smallest to greatest. 
// arrayPhotos.sort(function(a, b));
// 	return a - b;
// });

function rotatePhoto () {
	if (arrayPhotos.length-1 == currentPhoto) {
			currentPhoto = 0;
	} else {
			currentPhoto++;
			};
//		display on the page. 
  var image = document.querySelector("#imageSwap");
	// div.appendChild("img");
	image.setAttribute("src", arrayPhotos[currentPhoto]);
}

// repeat
var timer = setInterval(rotatePhoto, 5000)