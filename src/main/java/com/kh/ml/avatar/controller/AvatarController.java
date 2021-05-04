package com.kh.ml.avatar.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.avatar.model.service.AvatarService;
import com.kh.ml.avatar.model.vo.Avatar;
import com.kh.ml.clothes.model.service.ClothesService;
import com.kh.ml.clothes.model.vo.Clothes;
import com.kh.ml.common.util.file.FileVo;
import com.kh.ml.member.model.vo.Member;

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
	public void fitting(@RequestParam(defaultValue = "0") Integer avatarIdx
			, @RequestParam String clothesCode
			, Model model
			, @SessionAttribute(name = "userInfo") Member member) {
		
		//아바타 조회해오기
		Avatar avatar = avatarService.selectMaxAvatarByUserId(member.getUserId());
		
		if(avatar != null) {
			model.addAttribute("avatar", avatar);
			
			if(avatar.getTop() != 0) {
				FileVo fileVo = clothesService.selectFileByClothesIdx(avatar.getTop());
				model.addAttribute("top", fileVo);
			}
			
			if(avatar.getBottom() != 0) {
				FileVo fileVo = clothesService.selectFileByClothesIdx(avatar.getBottom());
				model.addAttribute("bottom", fileVo);
			}
			
			if(avatar.getShoes() != 0) {
				FileVo fileVo = clothesService.selectFileByClothesIdx(avatar.getShoes());
				model.addAttribute("shoe", fileVo);
			}
		}
		
		
		List<Clothes> clothesList = clothesService.selectClohtesByClothesCode(clothesCode);
		List<FileVo> files = new ArrayList<FileVo>();
		int[] IdxList = new int[clothesList.size()];  

		for(int i = 0; i < clothesList.size(); i++) {
			Clothes clothes = clothesList.get(i);
			FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
			files.add(file);
			IdxList[i] = clothes.getClothesIdx();
		}
		
		if(clothesCode.equals("1") || clothesCode.equals("2") || clothesCode.equals("3")) {
			model.addAttribute("topIdxList", IdxList);
			model.addAttribute("tops", files);
		}else if(clothesCode.equals("4") || clothesCode.equals("5") || clothesCode.equals("6")) {
			model.addAttribute("bottomIdxList", IdxList);
			model.addAttribute("bottoms", files);
		}else if(clothesCode.equals("7") || clothesCode.equals("8")) {
			model.addAttribute("shoesIdxList", IdxList);
			model.addAttribute("shoes", files);
		}
		
	}
	
	@PostMapping("saveImage")
	@ResponseBody
	public String saveImage(@RequestParam MultipartFile file) {
		if(file == null) {
			return "fail";
		}
		List<MultipartFile> files = new ArrayList<>();
		files.add(file);
		avatarService.saveImage(files);
		return "success";
	}
	
	@PostMapping("modify")
	public String modify(@RequestParam(defaultValue = "1") Integer modelFidx
			, @RequestParam(defaultValue = "0") Integer top
			, @RequestParam(defaultValue = "0") Integer topX
			, @RequestParam(defaultValue = "0") Integer topY
			, @RequestParam(defaultValue = "0") Integer bottom
			, @RequestParam(defaultValue = "0") Integer bottomX
			, @RequestParam(defaultValue = "0") Integer bottomY
			, @RequestParam(defaultValue = "0") Integer shoes
			, @RequestParam(defaultValue = "0") Integer shoesX
			, @RequestParam(defaultValue = "0") Integer shoesY
			, @SessionAttribute(name = "userInfo") Member member) {
		
		Avatar avatar = new Avatar();
		
		avatar.setModelFIdx(modelFidx.intValue());
		avatar.setTop(top.intValue());
		avatar.setTopX(topX.intValue());
		avatar.setTopY(topY.intValue());
		avatar.setBottom(bottom.intValue());
		avatar.setBottomX(bottomX.intValue());
		avatar.setBottomY(bottomY.intValue());
		avatar.setShoes(shoes.intValue());
		avatar.setShoesX(shoesX.intValue());
		avatar.setShoesY(shoesY.intValue());
		avatar.setUserId(member.getUserId());
		
		avatarService.insertAvatar(avatar);
		
		return "redirect:/member/history";
	}
}
