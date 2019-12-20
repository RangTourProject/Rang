package com.rang.jsp.mboardComment.model.vo;

import java.sql.Date;

public class MBoardComment {
    private int mcno;
    private int mbno;
    private String mccontent;
    private int userno;
    private Date mcdate;
    private int ref_mcno;
    private int mclevel;
    private String status;
    private String nickName;

    //

    public MBoardComment() {

    }

    //
    public MBoardComment(int mcno, int mbno, String mccontent, int userno, Date mcdate, int ref_mcno, int mclevel,
                         String status, String nickName) {
        super();
        this.mcno = mcno;
        this.mbno = mbno;
        this.mccontent = mccontent;
        this.userno = userno;
        this.mcdate = mcdate;
        this.ref_mcno = ref_mcno;
        this.mclevel = mclevel;
        this.status = status;
        this.nickName = nickName;
    }


    //

    @Override
    public String toString() {
        return "MBoardComment [mcno=" + mcno + ", mbno=" + mbno + ", mccontent=" + mccontent + ", userno=" + userno
                + ", mcdate=" + mcdate + ", ref_mcno=" + ref_mcno + ", mclevel=" + mclevel + ", status=" + status
                + ", nickName=" + nickName + "]";
    }


    //
    public int getMcno() {
        return mcno;
    }

    public void setMcno(int mcno) {
        this.mcno = mcno;
    }

    public int getMbno() {
        return mbno;
    }

    public void setMbno(int mbno) {
        this.mbno = mbno;
    }

    public String getMccontent() {
        return mccontent;
    }

    public void setMccontent(String mccontent) {
        this.mccontent = mccontent;
    }

    public int getUserno() {
        return userno;
    }

    public void setUserno(int userno) {
        this.userno = userno;
    }

    public Date getMcdate() {
        return mcdate;
    }

    public void setMcdate(Date mcdate) {
        this.mcdate = mcdate;
    }

    public int getRef_mcno() {
        return ref_mcno;
    }

    public void setRef_mcno(int ref_mcno) {
        this.ref_mcno = ref_mcno;
    }

    public int getMclevel() {
        return mclevel;
    }

    public void setMclevel(int mclevel) {
        this.mclevel = mclevel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }








}



