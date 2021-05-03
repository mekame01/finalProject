package com.kh.ml.avatar.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.avatar.model.vo.Avatar;

public interface AvatarService {

	Avatar selectOneAvatar(int avatarIdx);
	void saveImage(List<MultipartFile> files);
	void insertAvatar(Avatar avatar);
}
