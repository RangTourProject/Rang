package com.rang.jsp.like.model.dao;

import com.rang.jsp.like.model.vo.ILike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.rang.jsp.common.JDBCTemplate.close;

public class LikeDAO {

    // 좋아요 업데이트 용
    public int updateLike(Connection con, int memno, int mbno) {

        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO ILIKE VALUES(?, ?)";

        try{
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, memno);
            pstmt.setInt(2, mbno);

            result = pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;

    }

    // 좋아요 취소용
    public int updateUnLike(Connection con, int memno, int mbno) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "DELETE FROM ILIKE WHERE userno = ? AND mbno = ?";

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, memno);
            pstmt.setInt(2, mbno);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(pstmt);
        }


        return result;
    }

    public int likeCheck(Connection con, int memno, int mbno) {

        int result = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql= "SELECT COUNT(*) FROM ILIKE " +
                "WHERE userno = ? AND mbno = ?";

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, memno);
            pstmt.setInt(2, mbno);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                result = rset.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return result;
    }

    // 해당 게시글에 대하여 좋아요 누른 사람 조화
    public ArrayList<ILike> whoLike(Connection con, int mbno) {

        ArrayList<ILike> list = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try {

            String sql = "select * from ILIKE WHERE MBNO = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mbno);

            rset = pstmt.executeQuery();

            list = new ArrayList<>();

            while (rset.next()){

                ILike iLike = new ILike();

                iLike.setUserno(rset.getInt(1));
                iLike.setMbno(rset.getInt(2));

                list.add(iLike);

            }

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rset);
            close(pstmt);
        }

        return list;

    }
}
