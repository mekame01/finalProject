package com.kh.ml.common.code;

public enum Code {

	//Domain("http://pclass.com");
	DOMAIN("http://localhost:9090"),
//	EMAIL("mekame01@gmail.com"),
	EMAIL("junbum0502@naver.com"),
	UPLOAD("C:\\CODE\\G_SPRING\\resources\\upload\\");
	
	public String desc;
	
	Code(String desc){
		this.desc = desc;
	}
	
	public String toString() {
		return desc;
	}
}
