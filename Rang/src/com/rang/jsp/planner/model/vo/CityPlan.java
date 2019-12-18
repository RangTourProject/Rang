package com.rang.jsp.planner.model.vo;

public class CityPlan {
    // 도시계획 코드, 플래너 코드, 도시 이름
    private String cp_code;
    private String plan_code;
    private String city_name;
    private int day; // 여행일수
    private String trans;
    private String startday; // 교통수단, 시작일
    private float lat;
    private float lng;

    //    private City city;
    private int totalDay;

    private String userno;

    public CityPlan() {
    }

    public CityPlan(String plan_code, String city_name, int day, String trans, String startday) {
        this.plan_code = plan_code;
        this.city_name = city_name;
        this.day = day;
        this.trans = trans;
        this.startday = startday;
    }


    public CityPlan(String cp_code, String plan_code, String city_name, int day, String trans, String startday, float lat, float lng, int totalDay, String userno) {
        this.cp_code = cp_code;
        this.plan_code = plan_code;
        this.city_name = city_name;
        this.day = day;
        this.trans = trans;
        this.startday = startday;
        this.lat = lat;
        this.lng = lng;
        this.totalDay = totalDay;
        this.userno = userno;
    }


    @Override
    public String toString() {
        return "CityPlan{" +
                "cp_code='" + cp_code + '\'' +
                ", plan_code='" + plan_code + '\'' +
                ", city_name='" + city_name + '\'' +
                ", day=" + day +
                ", trans='" + trans + '\'' +
                ", startday='" + startday + '\'' +
                ", lat=" + lat +
                ", lng=" + lng +
                ", totalDay=" + totalDay +
                ", userno='" + userno + '\'' +
                '}';
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(float lat) {
        this.lat = lat;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(float lng) {
        this.lng = lng;
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

    public String getTrans() {
        return trans;
    }

    public void setTrans(String trans) {
        this.trans = trans;
    }

    public String getStartday() {
        return startday;
    }

    public void setStartday(String startday) {
        this.startday = startday;
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

}
