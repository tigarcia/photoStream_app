//logic for rotating images goes here:

// // set an empty var for currentImage:

var currentPhoto = 0;
var image = document.querySelector("#imageSwap");
var div = document.querySelector("#images");

// pull up a list of all photos from a given event from active record in an array. Each photo will be identified by its id (from active record).

var arrayPhotos = gon.arrayPhotos;
//pull out the urls into an array

//use the new array of urls in the rotatePhoto function

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