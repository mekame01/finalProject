package com.kh.ml.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.ml.common.code.Code;
import com.kh.ml.common.mail.MailSender;
import com.kh.ml.member.model.repository.MemberRepository;
import com.kh.ml.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository;
	
	@Autowired
	private RestTemplate http;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public MemberServiceImpl(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@Override
	public Member selectMemberById(String userId) {
		return memberRepository.selectMemberById(userId);
	}
	
	public void authenticateEmail(Member persistUser, String authPath) {
		
		MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
		body.add("userId", persistUser.getUserId());
		body.add("mail-template", "temp_join");
		body.add("authPath", authPath);
		
		RequestEntity<Map> request = 
				RequestEntity
				.post(Code.DOMAIN + "/mail")
				.contentType(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
		
		ResponseEntity<String> response =
				http.exchange(request, String.class);
		
		mailSender.send(persistUser.getEmail(), "회원가입을 축하합니다.", response.getBody());
		System.out.println("비동기 테스트를 위해 mailSender 아래에 작성한 출력문");
	}

	@Override
	public int insertMember(Member member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		return memberRepository.insertMember(member);
	}

	@Override
	public Member authenticateUser(Member member) {
		
		Member userInfo = memberRepository.selectMemberByForAuth(member.getUserId());
		if(userInfo == null ||
				!passwordEncoder.matches(member.getPassword(), userInfo.getPassword())) {
			return null;
		}
		return userInfo;
	}
	

}
