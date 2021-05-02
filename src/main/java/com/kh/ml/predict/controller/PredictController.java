package com.kh.ml.predict.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("predict")
public class PredictController {

	@GetMapping("tensorflow")
	public void predictClothes() {};
	
}
