package com.rang.jsp.planner.model.vo;

public class CityPlan {
    // 도시계획 코드, 플래너 코드, 도시 이름
    private String cp_code;
    private String plan_code;
    private String city_name;
    private int day; // 여행일수
    private String tran;
    private String startday; // 교통수단, 시작일

    private City city;
    private int totalDay;

    private String userno;

    public CityPlan() {
    }

    public CityPlan(String cp_code, String plan_code, String city_name, int day, String tran, String startday, City city, int totalDay, String userno) {
        this.cp_code = cp_code;
        this.plan_code = plan_code;
        this.city_name = city_name;
        this.day = day;
        this.tran = tran;
        this.startday = startday;
        this.city = city;
        this.totalDay = totalDay;
        this.userno = userno;
    }

    public String getCp_code() {
        return cp_code;
    }

    public void setCp_code(String cp_code) {
        this.cp_code = cp_code;
    }

    public String getPlan_code() {
        return plan_code;
    }

    public void setPlan_code(String plan_code) {
        this.plan_code = plan_code;
    }

    public String getCity_name() {
        return city_name;
    }

    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getTran() {
        return tran;
    }

    public void setTran(String tran) {
        this.tran = tran;
    }

    public String getStartday() {
        return startday;
    }

    public void setStartday(String startday) {
        this.startday = startday;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public int getTotalDay() {
        return totalDay;
    }

    public void setTotalDay(int totalDay) {
        this.totalDay = totalDay;
    }

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno;
    }

    @Override
    public String toString() {
        return "CityPlan{" +
                "cp_code='" + cp_code + '\'' +
                ", plan_code='" + plan_code + '\'' +
                ", city_name='" + city_name + '\'' +
                ", day=" + day +
                ", tran='" + tran + '\'' +
                ", startday='" + startday + '\'' +
                ", city=" + city +
                ", totalDay=" + totalDay +
                ", userno='" + userno + '\'' +
                '}';
    }
}
