package com.rang.jsp.myPage.model.vo;

import java.util.Date;

public class ChangeImage {
	
	private int userno;
	private String imgoriginname;
	private String imgchangename;
	private Date uploaddate;
	private String imgfilepath;
	
	
	public ChangeImage() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ChangeImage(int userno, String imgoriginname, String imgchangename, Date uploaddate, String imgfilepath) {
		super();
		this.userno = userno;
		this.imgoriginname = imgoriginname;
		this.imgchangename = imgchangename;
		this.uploaddate = uploaddate;
		this.imgfilepath = imgfilepath;
	}


	@Override
	public String toString() {
		return "ChangeImage [userno=" + userno + ", imgoriginname=" + imgoriginname + ", imgchangename=" + imgchangename
				+ ", uploaddate=" + uploaddate + ", imgfilepath=" + imgfilepath + "]";
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public String getImgoriginname() {
		return imgoriginname;
	}


	public void setImgoriginname(String imgoriginname) {
		this.imgoriginname = imgoriginname;
	}


	public String getImgchangename() {
		return imgchangename;
	}


	public void setImgchangename(String imgchangename) {
		this.imgchangename = imgchangename;
	}


	public Date getUploaddate() {
		return uploaddate;
	}


	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}


	public String getImgfilepath() {
		return imgfilepath;
	}


	public void setImgfilepath(String imgfilepath) {
		this.imgfilepath = imgfilepath;
	}
	
	
	
	
	
	
	
	
}


