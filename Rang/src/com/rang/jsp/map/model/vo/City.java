package com.rang.jsp.map.model.vo;

public class City {
    private String city_code;
    private String city_name;
    private float lat;
    private float lng;

    public City() {
    }

    public City(String city_code, String city_name, float lat, float lng) {
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

    public float getLat() {
        return lat;
    }

    public void setLat(float lat) {
        this.lat = lat;
    }

    public float getLng() {
        return lng;
    }

    public void setLng(float lng) {
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
