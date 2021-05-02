let classifier;
// 모델 불러오기
const URL = "/resources/model/";
let btnName = document.querySelector('#btn_name');
const modelURL = URL + "model.json";
const metadataURL = URL + "metadata.json";

async function init() {

	if (btnName.value == 'on') {
		btnName.innerHTML = "Stop";
		btnName.value = "off";
		// load the model and metadata
		// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
		// or files from your local hard drive
		// Note: the pose library adds "tmImage" object to your window (window.tmImage)
		model = await tmImage.load(modelURL, metadataURL);
		maxPredictions = model.getTotalClasses();

		// Convenience function to setup a webcam
		const flip = true; // whether to flip the webcam
		webcam = new tmImage.Webcam(400, 400, flip); // width, height, flip
		await webcam.setup(); // request access to the webcam
		await webcam.play();
		window.requestAnimationFrame(loop);

		// append elements to the DOM
		document.getElementById("webcam-container").appendChild(webcam.canvas);
		labelContainer = document.getElementById("label-container");
		for (let i = 0; i < maxPredictions; i++) { // and class labels
			console.log(maxPredictions)
			labelContainer.appendChild(document.createElement("div"));
		}

	} else {

		end();

	}
}

async function loop() {
	webcam.update(); // update the webcam frame
	await predict();
	window.requestAnimationFrame(loop);

}

// 이미지 예측
async function predict() {
	// predict can take in an image, video or canvas html element
	const prediction = await model.predict(webcam.canvas);


	let predictArr = [];
	let res;
	for (let i = 0; i < maxPredictions; i++) {
		const classPrediction =
			prediction[i].className + ": " + prediction[i].probability.toFixed(2);
		labelContainer.childNodes[i].innerHTML = classPrediction;
		//결과 확인용
		if (prediction[i].probability.toFixed(2) > 0.5) {

			predictArr.push(prediction[i].probability.toFixed(2));
			console.log(classPrediction);

		}


	}
	console.log(predictArr);
	//result = predictArr.indexOf(Math.max(...predictArr));
	//console.log("높은 예측값 predictArr: " + result);
	//인덱스 구하기

}

async function end() {
	btnName.innerHTML = "Start";
	btnName.value = 'on';
	document.getElementById("webcam-container").removeChild(webcam.canvas);
	labelContainer.innerHTML = "";
}

