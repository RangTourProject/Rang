package com.rang.jsp.mboard.model.dao;

import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;

import java.sql.*;
import java.util.ArrayList;

import static com.rang.jsp.common.JDBCTemplate.close;

public class MBoardDAO {

    // 게시글 등록용
    public int insertMBoard(Connection con, MBoard mb) {
        int result = 0;

        PreparedStatement pstmt = null;

        try{
            String sql = "insert into MBOARD values (SEQ_MBNO.nextval, ?, ?, ?, ?, ?, ?, ?,default , null , default , default )";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mb.getUserno());
            pstmt.setString(2, mb.getWriter());
            pstmt.setString(3, mb.getMbtitle());
            pstmt.setString(4, mb.getMbcontent());
            pstmt.setString(5, mb.getHashtag());
            pstmt.setString(6, mb.getLocationname());
            pstmt.setInt(7,mb.getTotalcost());

            result = pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 최근 게시글 조회용
    public int selectCurrentMBno(Connection con) {
        int result = 0;

        Statement stmt = null;
        ResultSet rset = null;

        try{
            String sql = "select MBNO from (select * from MBOARD ORDER BY MBDATE DESC) where ROWNUM = 1";

            stmt = con.createStatement();

            rset = stmt.executeQuery(sql);

            if(rset.next()){
                result = rset.getInt(1);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(stmt);
        }

        return result;
    }

    // 게시글 사진 등록용
    public int insertMAttachment(Connection con, ArrayList<MAttachment> list) {
        int result = 0;

        PreparedStatement pstmt = null;

        try{
            String sql = "insert into MATTACHMENT values (SEQ_MFNO.nextval, ?, ?, ?, default , ?, null , default)";

            pstmt = con.prepareStatement(sql);

            // list를 위한 for문
            for(int i = 0 ; i < list.size() ; i++){

                pstmt.setInt(1, list.get(i).getMbno());
                pstmt.setString(2, list.get(i).getMoriginName());
                pstmt.setString(3, list.get(i).getMchangeName());
                pstmt.setString(4, list.get(i).getMfilePath());
//
//                // 첫 이미지는 0 level (대표)
//                // 나머지는 1 level (서브)
//                if (i == 0) pstmt.setInt(5, 0);
//                else pstmt.setInt(5, 1);

                result += pstmt.executeUpdate(); // 실행된 수 만큼 result에 담는다
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }
}
