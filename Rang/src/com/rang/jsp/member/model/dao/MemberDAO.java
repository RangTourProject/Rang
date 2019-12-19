package com.rang.jsp.member.model.dao;

import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.tBoard.model.dao.TBoardDAO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.rang.jsp.common.JDBCTemplate.*;

public class MemberDAO {

    private Properties prop = new Properties();

    public MemberDAO() {
        String filePath = TBoardDAO.class.getResource("/mappers/member.properties").getPath();

        try {
            prop.load(new FileReader(filePath));
        } catch (FileNotFoundException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    // 회원 가입용 메소드
    public int insertMember(Connection con, Member m) {

        int result = 0;

        PreparedStatement pstmt = null;

        try{

            String sql = prop.getProperty("insertMember");

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, m.getEmail());
            pstmt.setString(2, m.getUserName());
            pstmt.setString(3, m.getPassword());
            pstmt.setString(4, m.getNickName());
            pstmt.setString(5, m.getBirthDate());
            pstmt.setString(6, m.getZipCode());
            pstmt.setString(7, m.getAddress());
            pstmt.setString(8, m.getPhone());

            result = pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 회원 한명 조회용
    public Member selectOne(Connection con, Member m) {

        Member mb = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectOne");

        try {

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, m.getEmail());
            pstmt.setString(2, m.getPassword());

            rset = pstmt.executeQuery();

            if(rset.next()){
                mb = new Member();

                mb.setUserNo(rset.getInt(1));
                mb.setEmail(m.getEmail());
                mb.setUserName(rset.getString(3));
                mb.setPassword(m.getPassword());
                mb.setNickName(rset.getString(5));
                mb.setBirthDate(rset.getString(6));
                mb.setZipCode(rset.getString(7));
                mb.setAddress(rset.getString(8));
                mb.setPhone(rset.getString(9));
                mb.setEnrollDate(rset.getDate(10));
                mb.setStatus(rset.getString(11));
                mb.setGrade(rset.getString(12));

            }

        } catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(pstmt);
        }

        return mb;
    }

    public int updateMember(Connection con, Member m) {
        int result = 0;
        PreparedStatement pstmt = null;

        try {

            String sql = prop.getProperty("updateMember");

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, m.getUserName());
            pstmt.setString(2, m.getPassword());
            pstmt.setString(3, m.getNickName());
            pstmt.setString(4, m.getZipCode());
            pstmt.setString(5, m.getAddress());
            pstmt.setString(6, m.getPhone());
            pstmt.setInt(7, m.getUserNo());

            result = pstmt.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }finally {

            close(pstmt);
        }

        return result;
    }

    public int deleteMember(Connection con, int userNo) {
        int result = 0;
        PreparedStatement pstmt = null;

        try {

            String sql  = prop.getProperty("deleteMember");

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, userNo);

            result = pstmt.executeUpdate();

        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int idDupCheck(Connection con, String email) {
        int result = 0;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = "SELECT COUNT(*) FROM MEMBER WHERE EMAIL = ?";

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, email);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                result = rset.getInt(1);
            }
        } catch (SQLException e) {

            e.printStackTrace();

        } finally {
            close(rset);
            close(pstmt);
        }

        return result;
    }


    public Member findId(Connection con, Member m) {

        Member result = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try {

            String sql = "SELECT * FROM MEMBER WHERE USERNAME = ? AND PHONE = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, m.getUserName());
            pstmt.setString(2, m.getPhone());

            rset = pstmt.executeQuery();

            if(rset.next()){
                result = new Member();

                result.setUserNo(rset.getInt(1));
                result.setEmail(rset.getString(2));
                result.setUserName(rset.getString(3));
                result.setPassword(rset.getString(4));
                result.setNickName(rset.getString(5));
                result.setBirthDate(rset.getString(6));
                result.setZipCode(rset.getString(7));
                result.setAddress(rset.getString(8));
                result.setPhone(rset.getString(9));
                result.setEnrollDate(rset.getDate(10));
                result.setStatus(rset.getString(11));
                result.setGrade(rset.getString(12));

            }

        } catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(pstmt);
        }

        return result;
    }

    public int findPwd(Connection con, Member m) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "UPDATE MEMBER SET PASSWORD = ? WHERE EMAIL = ? AND PHONE = ?";

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, m.getPassword());
            pstmt.setString(2, m.getEmail());
            pstmt.setString(3, m.getPhone());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {
            close(pstmt);
        }

        return result;
    }
}
