package com.kh.ml.member.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.ml.member.model.repository.MemberRepository;
import com.kh.ml.member.model.vo.Member;

@Component
public class MemberValidator implements Validator{
	
	private final MemberRepository memberRepository;
	
	public  MemberValidator(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	// supports : validator 가 실행될 조건을 지정
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Member.class.equals(clazz);
	}

	// target : 검증할 컨트롤러 메서드의 파라미터
	// errors : validator를 통과하지 못했을 때 컨트롤러에 보낼 에러코드와 메세지 지정
	@Override
	public void validate(Object target, Errors errors) {
		
		Member member = (Member) target;
		
		// 1. 아이디 존재 유무
		if(memberRepository.selectMemberById(member.getUserId()) != null) {
			errors.rejectValue("userId", "error.userId", "이미 존재하는 아이디 입니다.");
			// field : VO 이름
			// errorCode : 에러 이름
			// defaultMessage : 보낼 메세지 내용
		}
		
		// 2. 비밀번호가 8글자 이상의 숫자,특수문자,영문자 조합인지
		Pattern pattern = Pattern.compile("^(?!.*[ㄱ-힣])(?=.*\\W)(?=.*\\d)(?=.*[a-zA-Z])(?=.{8,})");
		if(!pattern.matcher(member.getPassword()).find()) {
			errors.rejectValue("password", "error.password", "비밀번호는 영어,숫자,특수문자 조합의 8글자 이상인 문자입니다.");
		}
		
		// 3. 이메일 존재 유무
		/*
		 * if(memberRepository.selectMemberByEmail(member.getEmail()) > 0) {
		 * errors.rejectValue("email", "error.email", "이미 존재하는 이메일 입니다."); }
		 */
		

		
		
		
	}

}
