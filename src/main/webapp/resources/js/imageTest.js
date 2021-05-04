/**
 * 
 */

function shoesTest() {
	document.querySelector('.result-btn2').innerHTML = '운동화';
	document.querySelector('.result-btn2')
		.setAttribute('value', '운동화');
	console
		.log(document
			.querySelector('.result-btn2').value);

}

async function setThumbnail(event) {
	if (document.querySelector("#image-container>img")) {
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

	shoesTest();

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



