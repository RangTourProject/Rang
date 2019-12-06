package com.rang.jsp.planner.model.vo;

import java.io.Serializable;

public class City implements Serializable {
    private String city_code;
    private String city_name;
    private double lat;
    private double lng;

    public City() {
    }

    public City(String city_code, String city_name, double lat, double lng) {
        this.city_code = city_code;
        this.city_name = city_name;
        this.lat = lat;
        this.lng = lng;
    }

    public String getCity_code() {
        return city_code;
    }

    public void setCity_code(String city_code) {
        this.city_code = city_code;
    }

    public String getCity_name() {
        return city_name;
    }

    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    @Override
    public String toString() {
        return "City{" +
                "city_code='" + city_code + '\'' +
                ", city_name='" + city_name + '\'' +
                ", lat=" + lat +
                ", lng=" + lng +
                '}';
    }
}
