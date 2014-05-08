//logic for rotating images goes here:

//ajax for wrapping JSON from FEWD Course 
var sc = {
getJSON: function(url, success) {
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var json = JSON.parse(xhr.response);
          success(json);
        }
      }
      xhr.open("GET", url);
      xhr.send();
    },
};

//set an empty var for currentImage:
var currentPhoto = 0;
//reach into DOM and select elements you will be playing with:
var image = document.querySelector("#imageSwap");
//commenting out becuase not needed? 
//var div = document.querySelector("#images");

// pull up a list of all photos from a given event from active record in an array. 
var arrayPhotos = gon.arrayPhotos;
var eventId = gon.eventId;
var url = gon.url;

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

// adding a second timer that checks for new images
function refetchPhotos () {
	sc.getJSON(url, updatePhotos);
	setInterval(refetchImages, 12000);
}
//add a function that gathers the new images

function updatePhotos (json) {
	arrayPhotos = json;
};










