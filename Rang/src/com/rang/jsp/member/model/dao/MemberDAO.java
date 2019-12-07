package com.rang.jsp.member.model.dao;

import com.rang.jsp.member.model.vo.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.rang.jsp.common.JDBCTemplate.*;

public class MemberDAO {

    // 회원 가입용 메소드
    public int insertMember(Connection con, Member m) {

        int result = 0;

        PreparedStatement pstmt = null;

        try{

            String sql = "insert into MEMBER values (SEQ_MEM.nextval, ?, ?, ?, ?, to_date(?,'YYMMDD'), ?, ?, ?, default, default, default)";

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

    public Member selectOne(Connection con, Member m) {

        Member mb = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try {

            String sql = "SELECT * FROM MEMBER WHERE EMAIL = ? AND PASSWORD = ?";

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
}
