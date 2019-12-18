package com.rang.jsp.tBoardComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class tBoardComment implements Serializable{
	
	private int tcno;
	private int tbno;
	private int userno;
	private String tccontent;
	private Date tcdate;
	private int tclevel;
	private String status;
	private int ref_tcno;
	

	// 기본 생성자
	public tBoardComment() {
	}


	
	// 사용자 정의 생성자
	public tBoardComment(int tcno, int tbno, int userno, String tccontent, Date tcdate, int tclevel, String status,
			int ref_tcno) {
		super();
		this.tcno = tcno;
		this.tbno = tbno;
		this.userno = userno;
		this.tccontent = tccontent;
		this.tcdate = tcdate;
		this.tclevel = tclevel;
		this.status = status;
		this.ref_tcno = ref_tcno;
	}


	// ? 생성자
	public tBoardComment(int tbno, int userno, String tccontent, int tclevel, int ref_tcno) {
		super();
		this.tbno = tbno;
		this.userno = userno;
		this.tccontent = tccontent;
		this.tclevel = tclevel;
		this.ref_tcno = ref_tcno;
	}
	


	public int getTcno() {
		return tcno;
	}






	public void setTcno(int tcno) {
		this.tcno = tcno;
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



	public String getTccontent() {
		return tccontent;
	}



	public void setTccontent(String tccontent) {
		this.tccontent = tccontent;
	}



	public Date getTcdate() {
		return tcdate;
	}



	public void setTcdate(Date tcdate) {
		this.tcdate = tcdate;
	}



	public int getTclevel() {
		return tclevel;
	}



	public void setTclevel(int tclevel) {
		this.tclevel = tclevel;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getRef_tcno() {
		return ref_tcno;
	}



	public void setRef_tcno(int ref_tcno) {
		this.ref_tcno = ref_tcno;
	}



	@Override
	public String toString() {
		return "tBoardComment [tcno=" + tcno + ", tbno=" + tbno + ", userno=" + userno + ", tccontent=" + tccontent
				+ ", tcdate=" + tcdate + ", tclevel=" + tclevel + ", status=" + status + ", ref_tcno=" + ref_tcno + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}