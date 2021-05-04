package com.kh.ml.avatar.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.avatar.model.repository.AvatarRepository;
import com.kh.ml.avatar.model.vo.Avatar;
import com.kh.ml.clothes.model.repository.ClothesRepository;
import com.kh.ml.common.util.file.FileUtil;
import com.kh.ml.common.util.file.FileVo;

@Service
public class AvatarServiceImpl implements AvatarService{

	private final AvatarRepository avatarRepository;
	private final ClothesRepository clothesRepository;
	
	public AvatarServiceImpl(AvatarRepository avatarRepository, ClothesRepository clothesRepository) {
		this.avatarRepository = avatarRepository;
		this.clothesRepository = clothesRepository;
	}

	@Override
	public Avatar selectOneAvatar(int avatarIdx) {
		return avatarRepository.selectOneAvatar(avatarIdx);
	}
	
	@Override
	public Avatar selectMaxAvatarByUserId(String userId) {
		return avatarRepository.selectMaxAvatarByUserId(userId);
	}
	
	@Transactional
	@Override
	public void saveImage(List<MultipartFile> files) {
		// TODO Auto-generated method stub
		try {
			FileUtil fileUtil = new FileUtil();
			List<FileVo> fileInfo = fileUtil.fileUpload(files);
			
			for (FileVo fileVo : fileInfo) {
				clothesRepository.insertFile(fileVo);
			}

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Transactional
	@Override
	public void insertAvatar(Avatar avatar) {
		avatarRepository.insertAvatar(avatar);
	}

}
