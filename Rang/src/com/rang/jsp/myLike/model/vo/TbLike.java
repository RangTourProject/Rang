package com.rang.jsp.myLike.model.vo;

public class TbLike {
	
	private int userNo;
	private int tBno;
	
	
	public TbLike() {
		super();
		// TODO Auto-generated constructor stub
	}


	public TbLike(int userNo, int tBno) {
		super();
		this.userNo = userNo;
		this.tBno = tBno;
	}


	@Override
	public String toString() {
		return "TbLike [userNo=" + userNo + ", tBno=" + tBno + "]";
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int gettBno() {
		return tBno;
	}


	public void settBno(int tBno) {
		this.tBno = tBno;
	}
	
	
	
}
