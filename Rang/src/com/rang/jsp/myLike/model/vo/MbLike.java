package com.rang.jsp.myLike.model.vo;

public class MbLike {
	
	
	private int userNo;
	private int mBno;
	
	
	public MbLike() {
		super();
		
	}

	
	public MbLike(int userNo, int mBno) {
		super();
		this.userNo = userNo;
		this.mBno = mBno;
	}


	@Override
	public String toString() {
		return "MbLike [userNo=" + userNo + ", mBno=" + mBno + "]";
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getmBno() {
		return mBno;
	}


	public void setmBno(int mBno) {
		this.mBno = mBno;
	}
	
	
	
	
	
	
	
}
