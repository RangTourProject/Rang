package com.rang.jsp.tBoard.model.vo;

import java.io.Serializable;
import java.util.Date;

public class TBoard implements Serializable{
	
	private int tbno;
	private int userno;
	private String writer;
	private String tbTitle;
	private String tbContent;
	private int maxmember;
	private int tbcount;
	private String tbfile;
	private Date tbdate;
	private String status;
	private String place;
	private int minmember;
	private int totalmember;

	// 기본
	public TBoard() {
	}


	public TBoard(int tbno, int userno, String writer, String tbTitle, String tbContent, int maxmember, int tbcount,
			String tbfile, Date tbdate, String status, String place, int minmember, int totalmember) {
		super();
		this.tbno = tbno;
		this.userno = userno;
		this.writer = writer;
		this.tbTitle = tbTitle;
		this.tbContent = tbContent;
		this.maxmember = maxmember;
		this.tbcount = tbcount;
		this.tbfile = tbfile;
		this.tbdate = tbdate;
		this.status = status;
		this.place = place;
		this.minmember = minmember;
		this.totalmember = totalmember;
	}




	@Override
	public String toString() {
		return "TBoard [tbno=" + tbno + ", userno=" + userno + ", writer=" + writer + ", tbTitle=" + tbTitle
				+ ", tbContent=" + tbContent + ", maxmember=" + maxmember + ", tbcount=" + tbcount + ", tbfile="
				+ tbfile + ", tbdate=" + tbdate + ", status=" + status + ", place=" + place + ", minmember=" + minmember
				+ ", totalmember=" + totalmember + "]";
	}




	/**
	 * @return the totalmember
	 */
	public int getTotalmember() {
		return totalmember;
	}

	/**
	 * @param totalmember the totalmember to set
	 */
	public void setTotalmember(int totalmember) {
		this.totalmember = totalmember;
	}




	// insert 용
	public TBoard(int userno, String writer, String tbTitle, String tbContent, String tbfile, String place, int maxmember) {
		this.userno = userno;
		this.writer = writer;
		this.tbTitle = tbTitle;
		this.tbContent = tbContent;
		this.tbfile = tbfile;
		this.place = place;
		this.maxmember = maxmember;
	}



	public int getTbno() {
		return tbno;
	}

	public void setTbno(int tbno) {
		this.tbno = tbno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTbTitle() {
		return tbTitle;
	}

	public void setTbTitle(String tbTitle) {
		this.tbTitle = tbTitle;
	}

	public String getTbContent() {
		return tbContent;
	}

	public void setTbContent(String tbContent) {
		this.tbContent = tbContent;
	}

	public int getMaxmember() {
		return maxmember;
	}

	public void setMaxmember(int maxmember) {
		this.maxmember = maxmember;
	}

	public int getTbcount() {
		return tbcount;
	}

	public void setTbcount(int tbcount) {
		this.tbcount = tbcount;
	}

	public String getTbfile() {
		return tbfile;
	}

	public void setTbfile(String tbfile) {
		this.tbfile = tbfile;
	}

	public Date getTbdate() {
		return tbdate;
	}

	public void setTbdate(Date tbdate) {
		this.tbdate = tbdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
	public int getMinmember() {
		return minmember;
	}
	
	public void setMinmember(int minmember) {
		this.minmember = minmember;
	}

}
