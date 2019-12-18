package com.rang.jsp.myLike.model.vo;

import java.util.ArrayList;

public class MbLike {
	
	// 20191217 add nickName -Seoan-
	private int userNo;
	private int mbno;
	private String nickName;
	
	
	public MbLike() {
		super();
		
	}

	
	public MbLike(int userNo, int mbno, String nickName) {
		super();
		this.userNo = userNo;
		this.mbno = mbno;
		this.nickName = nickName;
	}


	@Override
	public String toString() {
		return "MbLike [userNo=" + userNo + ", mbno=" + mbno + ", nickName=" + nickName + "]";
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getmbno() {
		return mbno;
	}


	public void setmbno(int mbno) {
		this.mbno = mbno;
	}
	
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	
	
	
	
}
