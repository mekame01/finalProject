package com.kh.ml.member.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.ml.common.code.ErrorCode;
import com.kh.ml.common.exception.ToAlertException;
import com.kh.ml.member.model.service.MemberService;
import com.kh.ml.member.model.vo.Member;
import com.kh.ml.member.validator.MemberValidator;

@Controller
@RequestMapping("member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	MemberService memberService;
	MemberValidator memberValidator;
	
	public MemberController(MemberService memberService, MemberValidator memberValidator) {
		this.memberService = memberService;
		this.memberValidator = memberValidator;
	}
	
	// InitBinder : WebDataBinder를 초기화 하는 메서드를 식별하는 주석
	//		value : webDataBinder가 적용될 파라미터 명 또는 
	//				Model의 attribute 이름
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		// webDataBinder : 컨트롤러 메서드의 파라미터에 데이터를 bind 해준다.
		webDataBinder.addValidators(memberValidator);
	}

	@GetMapping("join")
	public void member() {};
	
	@GetMapping("idcheck")
	@ResponseBody // 비동기이므로 @ResponseBody 사용
	public String idCheck(String userId) {
		if(memberService.selectMemberById(userId) != null) {
			return "fail";
		}
		return "success";
	}
	
	@PostMapping("mailauth")
	// @Valid 로 지정하면 support 에서 지정한 타입인지 먼저 확인한다.
	//	넘어오는 컨트롤러 파라미터로 validator 동작
	public String authenticateEmail(@Valid Member persistInfo
			, Errors error // 반드시 @Valid 변수 바로 뒤에 와야한다.
			, HttpSession session
			, Model model) {
		
		if(error.hasErrors()) {
			return "member/join";
		}
		
		String authPath = UUID.randomUUID().toString();
		
		// session에 persistInfo 저장
		session.setAttribute("persistInfo", persistInfo);
		session.setAttribute("authPath", authPath);
		
		// memberService의 authenticateEmail 호출해서 회원가입 메일 발송
		memberService.authenticateEmail(persistInfo, authPath);
		
		// 메일발송 안내창 출력 후 index 페이지로 페이지 이동
		model.addAttribute("msg","이메일 발송이 완료되었습니다.");
		model.addAttribute("url","/index");
		
		// 보낼 페이지 (.jsp 붙이면 안됨)
		return "common/result";
	}
	
	@GetMapping("joinimpl/{authPath}")
	public String joinImpl(HttpSession session
			,@PathVariable String authPath
			,@SessionAttribute("authPath") String sessionPath
			,@SessionAttribute("persistInfo") Member persistInfo
			,Model model) {
		
		if(!authPath.equals(sessionPath)) {
			throw new ToAlertException(ErrorCode.AUTH02);
		}
		
		memberService.insertMember(persistInfo);
			
		model.addAttribute("msg","회원가입이 완료되었습니다.");
		model.addAttribute("url","/index");
		session.removeAttribute("persistInfo");
		return "common/result" ;
	}
	
	@GetMapping("login")
	public void login(){};

	@PostMapping("loginimpl")
	@ResponseBody
	public String loginImpl(@RequestBody Member member
			,HttpSession session) {
		Member userInfo = memberService.authenticateUser(member);
		if(userInfo == null) {
			return "fail";
		}
		session.setAttribute("userInfo", userInfo);
		return "success";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/index";
	}
	
}
