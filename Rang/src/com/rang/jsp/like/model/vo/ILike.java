package com.rang.jsp.like.model.vo;

public class ILike {
    private int userno;
    private int mbno;

    public ILike() {
    }

    public ILike(int userno, int mbno) {
        this.userno = userno;
        this.mbno = mbno;
    }

    @Override
    public String toString() {
        return "ILike{" +
                "userno=" + userno +
                ", mbno=" + mbno +
                '}';
    }

    public int getUserno() {
        return userno;
    }

    public void setUserno(int userno) {
        this.userno = userno;
    }

    public int getMbno() {
        return mbno;
    }

    public void setMbno(int mbno) {
        this.mbno = mbno;
    }
}
