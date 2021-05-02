/**
 * 
 */

async function setThumbnail(event) {

	let reader = new FileReader();

	reader.onload =  function(event) {
		let img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute('width', 400);
		img.setAttribute('height', 400);
		document.querySelector("#image-container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
	
	imgTest();
}


async function imgTest() {
    img = document.querySelector("#image-container img");
	const model = await tmImage.load(modelURL, metadataURL);
	maxPredictions =  model.getTotalClasses();
    prediction = await model.predict(img);
    console.log(prediction);
	labelContainer = document.getElementById("label-container2");
	
	
}

	  
