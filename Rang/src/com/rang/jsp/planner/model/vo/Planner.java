package com.rang.jsp.planner.model.vo;

public class Planner {
    private int plan_code; // 플랜 번호
    private int userno; // 유저번호
    private String title; // 제목
    private int people; // 인원수
    private String startday; // 시작일

    private CityPlan cityplan;

    public Planner() {
    }

    public Planner(int plan_code, int userno, String title, int people, String startday, CityPlan cityplan) {
        this.plan_code = plan_code;
        this.userno = userno;
        this.title = title;
        this.people = people;
        this.startday = startday;
        this.cityplan = cityplan;
    }

    public String getStartday() {
        return startday;
    }

    public void setStartday(String startday) {
        this.startday = startday;
    }

    // 입력용
    public Planner(int userno, String title, int people, String startday) {
        this.userno = userno;
        this.title = title;
        this.people = people;
        this.startday = startday;
    }

    public int getPlan_code() {
        return plan_code;
    }

    public void setPlan_code(int plan_code) {
        this.plan_code = plan_code;
    }

    public int getUserno() {
        return userno;
    }

    public void setUserno(int userno) {
        this.userno = userno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public CityPlan getCityplan() {
        return cityplan;
    }

    public void setCityplan(CityPlan cityplan) {
        this.cityplan = cityplan;
    }

    @Override
    public String toString() {
        return "Planner{" +
                "plan_code=" + plan_code +
                ", userno=" + userno +
                ", title='" + title + '\'' +
                ", people=" + people +
                ", startday='" + startday + '\'' +
                ", cityplan=" + cityplan +
                '}';
    }
}
