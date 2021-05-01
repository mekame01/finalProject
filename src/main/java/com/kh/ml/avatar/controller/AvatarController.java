package com.kh.ml.avatar.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ml.avatar.model.service.AvatarService;
import com.kh.ml.clothes.model.service.ClothesService;
import com.kh.ml.clothes.model.vo.Clothes;
import com.kh.ml.common.util.file.FileVo;

@Controller
@RequestMapping("avatar")
public class AvatarController {

	private final AvatarService avatarService;
	private final ClothesService clothesService;
	
	public AvatarController(AvatarService avatarService, ClothesService clothesService) {
		this.avatarService = avatarService;
		this.clothesService = clothesService;
	}
	
	@GetMapping("fitting")
	public void fitting(Model model) {
		String top = "1";
		String bottom = "4";
		String shoe = "7";
		
		if(top != null) {
			List<Clothes> tops = clothesService.selectClohtesByClothesCode(top);
			List<FileVo> files = new ArrayList<FileVo>();

			for (Clothes clothes : tops) {
				FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
				files.add(file);
			}
			model.addAttribute("tops", files);
		}
		
		if(bottom != null) {
			List<Clothes> bottoms = clothesService.selectClohtesByClothesCode(bottom);
			List<FileVo> files = new ArrayList<FileVo>();

			for (Clothes clothes : bottoms) {
				FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
				files.add(file);
			}
			model.addAttribute("bottoms", files);
		}
		
		if(shoe != null) {
			List<Clothes> shoes = clothesService.selectClohtesByClothesCode(shoe);
			List<FileVo> files = new ArrayList<FileVo>();

			for (Clothes clothes : shoes) {
				FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
				files.add(file);
			}
			model.addAttribute("shoes", files);
		}
		
	}
	
	@PostMapping("modify")
	public void modify() {
		
	}
}
