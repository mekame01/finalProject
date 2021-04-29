package com.kh.ml.clothes.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.clothes.model.vo.Clothes;
import com.kh.ml.common.util.file.FileVo;

public interface ClothesService {
	
	List<Clothes> selectClothes();
	FileVo selectClothesFile(int fIdx);
	void insertClothes(String division, List<MultipartFile> files);
}
