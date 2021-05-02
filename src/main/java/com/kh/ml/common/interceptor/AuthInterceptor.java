package com.kh.ml.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.ml.common.code.ErrorCode;
import com.kh.ml.common.exception.ToAlertException;

public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String[] uriArr = request.getRequestURI().split("/");
		
		if(uriArr.length > 0) {
			switch (uriArr[1]) {
			case "member":
				switch (uriArr[2]) {
				case "mypage": if(session.getAttribute("userInfo") == null) {
						throw new ToAlertException(ErrorCode.AUTH01);
					}
				break;
				case "joinImpl": if(session.getAttribute("persistInfo") == null) {
						throw new ToAlertException(ErrorCode.AUTH02);
					}
				break;
				default:
				}
			default:
			}
		}
		
		return true;
	}
}
