package com.kh.ml.tensor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("ml")
public class TensorController {


	@GetMapping("mlTest")
	public void mlTest() {
	}


}
