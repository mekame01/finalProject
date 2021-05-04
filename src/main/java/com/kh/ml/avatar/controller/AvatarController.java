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
			, Model model
			, @SessionAttribute(name = "userInfo") Member member) {
		String top = "1";
		String bottom = "4";
		String shoe = "7";
		
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
		
		
		if(top != null) {
			List<Clothes> tops = clothesService.selectClohtesByClothesCode(top);
			List<FileVo> files = new ArrayList<FileVo>();
			int[] topIdxList = new int[tops.size()];  

			for(int i = 0; i < tops.size(); i++) {
				Clothes clothes = tops.get(i);
				FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
				files.add(file);
				topIdxList[i] = clothes.getClothesIdx();
			}
			model.addAttribute("topIdxList", topIdxList);
			model.addAttribute("tops", files);
		}
		
		if(bottom != null) {
			List<Clothes> bottoms = clothesService.selectClohtesByClothesCode(bottom);
			List<FileVo> files = new ArrayList<FileVo>();
			int[] bottomIdxList = new int[bottoms.size()];  

			for(int i = 0; i < bottoms.size(); i++) {
				Clothes clothes = bottoms.get(i);
				FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
				files.add(file);
				bottomIdxList[i] = clothes.getClothesIdx();
			}
			model.addAttribute("bottomIdxList", bottomIdxList);
			model.addAttribute("bottoms", files);
		}
		
		if(shoe != null) {
			List<Clothes> shoes = clothesService.selectClohtesByClothesCode(shoe);
			List<FileVo> files = new ArrayList<FileVo>();
			int[] shoesIdxList = new int[shoes.size()];  

			for(int i = 0; i < shoes.size(); i++) {
				Clothes clothes = shoes.get(i);
				FileVo file = clothesService.selectClothesFile(clothes.getClothesFIdx());
				files.add(file);
				shoesIdxList[i] = clothes.getClothesIdx();
			}
			model.addAttribute("shoesIdxList", shoesIdxList);
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
