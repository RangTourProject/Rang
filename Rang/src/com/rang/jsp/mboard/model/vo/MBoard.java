package com.rang.jsp.mboard.model.vo;

import java.util.ArrayList;
import java.util.Date;

import com.rang.jsp.myLike.model.vo.MbLike;

public class MBoard {
    private int mbno;
    private int userno;
    private String writer;
    private String mbtitle;
    private String mbcontent;
    private String hashtag;
    private String locationname;
    private int totalcost;
    private int mbcount;
    private String mbfile;
    private Date mbdate;
    private String status;
    private int likecount;
    private int commentcount;
    
    
    
    public MBoard() {
    }


	public MBoard(int mbno, int userno, String writer, String mbtitle, String mbcontent, String hashtag,
			String locationname, int totalcost, int mbcount, String mbfile, Date mbdate, String status) {
		super();
		this.mbno = mbno;
		this.userno = userno;
		this.writer = writer;
		this.mbtitle = mbtitle;
		this.mbcontent = mbcontent;
		this.hashtag = hashtag;
		this.locationname = locationname;
		this.totalcost = totalcost;
		this.mbcount = mbcount;
		this.mbfile = mbfile;
		this.mbdate = mbdate;
		this.status = status;
	}


	@Override
	public String toString() {
		return "MBoard [mbno=" + mbno + ", userno=" + userno + ", writer=" + writer + ", mbtitle=" + mbtitle
				+ ", mbcontent=" + mbcontent + ", hashtag=" + hashtag + ", locationname=" + locationname
				+ ", totalcost=" + totalcost + ", mbcount=" + mbcount + ", mbfile=" + mbfile + ", mbdate=" + mbdate
				+ ", status=" + status + "]";
	}


	public int getMbno() {
		return mbno;
	}


	public void setMbno(int mbno) {
		this.mbno = mbno;
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


	public String getMbtitle() {
		return mbtitle;
	}


	public void setMbtitle(String mbtitle) {
		this.mbtitle = mbtitle;
	}


	public String getMbcontent() {
		return mbcontent;
	}


	public void setMbcontent(String mbcontent) {
		this.mbcontent = mbcontent;
	}


	public String getHashtag() {
		return hashtag;
	}


	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}


	public String getLocationname() {
		return locationname;
	}


	public void setLocationname(String locationname) {
		this.locationname = locationname;
	}


	public int getTotalcost() {
		return totalcost;
	}


	public void setTotalcost(int totalcost) {
		this.totalcost = totalcost;
	}


	public int getMbcount() {
		return mbcount;
	}


	public void setMbcount(int mbcount) {
		this.mbcount = mbcount;
	}


	public String getMbfile() {
		return mbfile;
	}


	public void setMbfile(String mbfile) {
		this.mbfile = mbfile;
	}


	public Date getMbdate() {
		return mbdate;
	}


	public void setMbdate(Date mbdate) {
		this.mbdate = mbdate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getLikecount() {
		return likecount;
	}


	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}


	public int getCommentcount() {
		return commentcount;
	}


	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}


    
}