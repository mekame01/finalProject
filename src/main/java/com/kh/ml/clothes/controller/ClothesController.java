package com.kh.ml.clothes.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.clothes.model.service.ClothesService;
import com.kh.ml.clothes.model.vo.Clothes;
import com.kh.ml.common.util.file.FileVo;

@Controller
@RequestMapping("clothes")
public class ClothesController {
	
	private final ClothesService clothesService;
	
	public ClothesController(ClothesService clothesService) {
		this.clothesService = clothesService;
	}
	
	@GetMapping("clothes")
	public void clothes(Model model) {
		String[] categories = {"셔츠","긴팔","반팔","긴바지","반바지","치마","구두","운동화"};
		
		List<Clothes> clothes = clothesService.selectClothes();
		List<FileVo> files = new ArrayList<FileVo>();
		
		for (Clothes cloth : clothes) {
			
			FileVo file = clothesService.selectClothesFile(cloth.getClothesFIdx());
			files.add(file);
		}
		model.addAttribute("categories", categories);
		model.addAttribute("clothes", clothes);
		model.addAttribute("files", files);
	}
	
	@PostMapping("clothes")
	public String modifyClothes(@RequestParam String division
			, @RequestParam(required = false) List<Integer> delFiles
			, @RequestParam List<MultipartFile> files) {
		clothesService.updateClothes(division, files, delFiles);
		return "redirect:/clothes/clothes";
	}
}
