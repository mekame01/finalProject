package com.kh.ml.member.model.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ml.member.model.vo.Member;

public interface MemberService {

	Member selectMemberById(String userId);
	void authenticateEmail(Member member, String authPath);
	int insertMember(Member member);
	Member authenticateUser(Member member);
	
	void uploadFace(String userId, List<MultipartFile> files);
	
}
