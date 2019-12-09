package com.rang.jsp.mboard.model.vo;

import java.util.Date;

public class MAttachment {
    private int mfno;
    private int mbno;
    private String moriginName;
    private String mchangeName;
    private Date uploadDate;
    private String mfilePath;
    private int mflevel;
    private String status;

    public MAttachment() {
    }

    public MAttachment(int mfno, int mbno, String moriginName, String mchangeName, Date uploadDate, String mfilePath, int mflevel, String status) {
        this.mfno = mfno;
        this.mbno = mbno;
        this.moriginName = moriginName;
        this.mchangeName = mchangeName;
        this.uploadDate = uploadDate;
        this.mfilePath = mfilePath;
        this.mflevel = mflevel;
        this.status = status;
    }

    public int getMfno() {
        return mfno;
    }

    public void setMfno(int mfno) {
        this.mfno = mfno;
    }

    public int getMbno() {
        return mbno;
    }

    public void setMbno(int mbno) {
        this.mbno = mbno;
    }

    public String getMoriginName() {
        return moriginName;
    }

    public void setMoriginName(String moriginName) {
        this.moriginName = moriginName;
    }

    public String getMchangeName() {
        return mchangeName;
    }

    public void setMchangeName(String mchangeName) {
        this.mchangeName = mchangeName;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getMfilePath() {
        return mfilePath;
    }

    public void setMfilePath(String mfilePath) {
        this.mfilePath = mfilePath;
    }

    public int getMflevel() {
        return mflevel;
    }

    public void setMflevel(int mflevel) {
        this.mflevel = mflevel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
