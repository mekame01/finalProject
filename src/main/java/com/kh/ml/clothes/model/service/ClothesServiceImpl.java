package com.kh.ml.clothes.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.clothes.model.repository.ClothesRepository;
import com.kh.ml.clothes.model.vo.Clothes;
import com.kh.ml.common.util.file.FileUtil;
import com.kh.ml.common.util.file.FileVo;

@Service
public class ClothesServiceImpl implements ClothesService{

	private final ClothesRepository clothesRepository;
	
	public ClothesServiceImpl(ClothesRepository clothesRepository) {
		this.clothesRepository = clothesRepository;
	}


	@Override
	public List<Clothes> selectClothes() {
		List<Clothes> clotheses = clothesRepository.selectClothes();
		return clotheses;
	}

	@Override
	public FileVo selectClothesFile(int fIdx) {
		return clothesRepository.selectClothesFile(fIdx);
	}

	@Transactional
	@Override
	public void updateClothes(String division, List<MultipartFile> files, List<Integer> delFiles) {
		try {
			FileUtil fileUtil = new FileUtil();
			
			if(delFiles != null) {
				for (Integer integer : delFiles) {
					int clothesIdx = integer.intValue();
					Clothes clothes = clothesRepository.selectOneClothes(clothesIdx);
					if(clothes != null) {
						clothesRepository.deleteClohtes(clothesIdx);
						
						FileVo fileVo = clothesRepository.selectOneFile(clothes.getClothesFIdx());
						fileUtil.deleteFile(fileVo.getFullPath(), fileVo.getRenameFileName());
					}
				}
			}
			
			List<FileVo> fileInfo = fileUtil.fileUpload(files);
			for (FileVo fileVo : fileInfo) {
				
				clothesRepository.insertFile(fileVo);
				
				Clothes clothes = new Clothes();
				clothes.setClothesCode(division);
				
				clothesRepository.insertClohtes(clothes);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
			
	}


	@Override
	public List<Clothes> selectClohtesByClothesCode(String clothesCode) {
		return clothesRepository.selectClohtesByClothesCode(clothesCode);
	}

}
