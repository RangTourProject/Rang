package com.rang.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {
    private int userNo;
    private String email;
    private String userName;
    private String password;
    private String nickName;
    private String birthDate;
    private String zipCode;
    private String address;
    private String phone;
    private Date enrollDate;
    private String status;
    private String grade;

    public Member() {
    }

    // 로그인용
    public Member(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // 회원 수정용
    public Member(int userNo, String userName, String password, String nickName, String zipCode, String address, String phone) {
        this.userNo = userNo;
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
        this.zipCode = zipCode;
        this.address = address;
        this.phone = phone;
    }

    // 전체
    public Member(int userNo, String email, String userName, String password, String nickName, String birthDate, String zipCode, String address, String phone, Date enrollDate, String status, String grade) {
        this.userNo = userNo;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
        this.birthDate = birthDate;
        this.zipCode = zipCode;
        this.address = address;
        this.phone = phone;
        this.enrollDate = enrollDate;
        this.status = status;
        this.grade = grade;
    }

    // 회원가입용
    public Member(String email, String userName, String password, String nickName, String birthDate, String zipCode, String address, String phone) {
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
        this.birthDate = birthDate;
        this.zipCode = zipCode;
        this.address = address;
        this.phone = phone;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Member{" +
                "userNo=" + userNo +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", enrollDate=" + enrollDate +
                ", status='" + status + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}

