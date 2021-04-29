package com.kh.ml.clothes.model.vo;

public class Clothes {

	private int clothesIdx;
	private String clothesCode;
	private int clothesFIdx;
	private int isDel;
	
	public int getClothesIdx() {
		return clothesIdx;
	}

	public void setClothesIdx(int clothesIdx) {
		this.clothesIdx = clothesIdx;
	}

	public String getClothesCode() {
		return clothesCode;
	}

	public void setClothesCode(String clothesCode) {
		this.clothesCode = clothesCode;
	}

	public int getClothesFIdx() {
		return clothesFIdx;
	}

	public void setClothesFIdx(int clothesFIdx) {
		this.clothesFIdx = clothesFIdx;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	@Override
	public String toString() {
		return "Clothes [clothesIdx=" + clothesIdx + ", clothesCode=" + clothesCode + ", clothesFIdx=" + clothesFIdx
				+ ", isDel=" + isDel + "]";
	}
}
