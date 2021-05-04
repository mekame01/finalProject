let classifier;
// 모델 불러오기
const URL = "/resources/model/";
let btnName = document.querySelector('#btn_name');
const modelURL = URL + "model.json";
const metadataURL = URL + "metadata.json";
let result = "";
let newRes;
async function init() {

	if (btnName.value == 'on') {

		if (document.querySelector("#webcam-container>canvas")) {

					document.querySelector("#webcam-container").removeChild(webcam.canvas);
		}
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
			//console.log(maxPredictions);
			labelContainer.appendChild(document.createElement("div"));
		}
	} else {

		document.querySelector('.result-btn').innerHTML = newRes;
		document.querySelector('.result-btn').setAttribute('value', result);
		
		end();
		if(document.querySelector('#fitting2 input')){
			
		document.querySelector('#fitting2 input').setAttribute('value', newRes);
		}

		capture();
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
	let newLabeles = [7, 4, 2, 5, 3, 1, 8, 6];

	for (let i = 0; i < maxPredictions; i++) {
		const classPrediction =
			prediction[i].className + ": " + prediction[i].probability.toFixed(2);
		labelContainer.childNodes[i].innerHTML = classPrediction;

		predictArr.push(prediction[i].probability.toFixed(2));
		//console.log(predictArr);

		//결과 확인용
		if (prediction[i].probability.toFixed(2) > 0.5) {


			//console.log("예측값 : " + classPrediction);
			result = prediction[i].className;
			newRes = newLabeles[i];
			console.log("new label : " + newRes);
		}
		//캡쳐랑 라벨 보내기 : avatar/fitting 로 데이터 넘기기

	}
	//result = predictArr.indexOf(Math.max(...predictArr));
	//console.log("높은 예측값 predictArr: " + result);
	//인덱스 구하기

}






async function end() {

	btnName.innerHTML = "Start";
	btnName.value = 'on';


	labelContainer.innerHTML = "";

}

function capture() {
	html2canvas(document.querySelector("#webcam-container"), {
		onrendered: function(canvas) {
			var img = canvas.toDataURL("image/png");
			console.log(img);
			document.querySelector("#label-container").append('<img src=' + img + '>'); // capture 내용이 보여짐
			window.open(img); // 이미지를 윈도우 팝업으로..

		}
	});
}

