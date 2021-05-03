package com.kh.ml.avatar.model.vo;

public class Avatar {

	private int avatarIdx;
	private String userId;
	private int modelFIdx;
	private int top;
	private int topX;
	private int topY;
	private int bottom;
	private int bottomX;
	private int bottomY;
	private int shoes;
	private int shoesX;
	private int shoesY;

	public int getAvatarIdx() {
		return avatarIdx;
	}

	public void setAvatarIdx(int avatarIdx) {
		this.avatarIdx = avatarIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getModelFIdx() {
		return modelFIdx;
	}

	public void setModelFIdx(int modelFIdx) {
		this.modelFIdx = modelFIdx;
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public int getTopX() {
		return topX;
	}

	public void setTopX(int topX) {
		this.topX = topX;
	}

	public int getTopY() {
		return topY;
	}

	public void setTopY(int topY) {
		this.topY = topY;
	}

	public int getBottom() {
		return bottom;
	}

	public void setBottom(int bottom) {
		this.bottom = bottom;
	}

	public int getBottomX() {
		return bottomX;
	}

	public void setBottomX(int bottomX) {
		this.bottomX = bottomX;
	}

	public int getBottomY() {
		return bottomY;
	}

	public void setBottomY(int bottomY) {
		this.bottomY = bottomY;
	}

	public int getShoes() {
		return shoes;
	}

	public void setShoes(int shoes) {
		this.shoes = shoes;
	}

	public int getShoesX() {
		return shoesX;
	}

	public void setShoesX(int shoesX) {
		this.shoesX = shoesX;
	}

	public int getShoesY() {
		return shoesY;
	}

	public void setShoesY(int shoesY) {
		this.shoesY = shoesY;
	}

	@Override
	public String toString() {
		return "Avatar [avatarIdx=" + avatarIdx + ", userId=" + userId + ", modelFIdx=" + modelFIdx + ", top=" + top
				+ ", topX=" + topX + ", topY=" + topY + ", bottom=" + bottom + ", bottomX=" + bottomX + ", bottomY="
				+ bottomY + ", shoes=" + shoes + ", shoesX=" + shoesX + ", shoesY=" + shoesY + "]";
	}
}
