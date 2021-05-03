/**
 * 
 */



async function setThumbnail(event) {
	if(document.querySelector("#image-container>img")){
	document.querySelector("#image-container").removeChild(img);
	}
	let reader = new FileReader();

	reader.onload = function(event) {
		let img = document.createElement("img");

		img.setAttribute("src", event.target.result);
		img.setAttribute('width', 400);
		img.setAttribute('height', 400);
		img.setAttribute('id', "uploadImg");

		document.querySelector("#image-container").appendChild(img);


	};
	reader.readAsDataURL(event.target.files[0]);

	imgTest();
}


async function imgTest() {
	img = document.querySelector("#image-container img");
	const model = await tmImage.load(modelURL, metadataURL);
	maxPredictions = model.getTotalClasses();
	const predictionImg = await model.predict(img, flipped = false);
	console.log(predictionImg);

	labelContainer = document.getElementById("label-container2");


}



