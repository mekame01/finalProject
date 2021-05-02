package com.kh.ml.member.model.service;


import com.kh.ml.member.model.vo.Member;

public interface MemberService {

	Member selectMemberById(String userId);
	void authenticateEmail(Member member, String authPath);
	int insertMember(Member member);
	Member authenticateUser(Member member);
	
}
