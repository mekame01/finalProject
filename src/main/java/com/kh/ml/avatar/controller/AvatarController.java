package com.kh.ml.avatar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("avatar")
public class AvatarController {

	@GetMapping("fitting")
	public void fitting() {}
	
}
