package com.rang.jsp.mboardComment.model.dao;

import com.rang.jsp.mboardComment.model.vo.MBoardComment;
import com.rang.jsp.member.model.vo.Member;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.close;

public class MBoardCommentDAO {

    public int insertMComment(Connection con, MBoardComment mbc) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO MCOMMENT VALUES(SEQ_MC.NEXTVAL, ?, ?, ?, SYSDATE, (NVL((SELECT MCLEVEL FROM MCOMMENT WHERE MCNO = ?), -1) + 1), DEFAULT, ?)";

        try {

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mbc.getMbno());
            pstmt.setInt(2, mbc.getUserno());
            pstmt.setString(3, mbc.getMccontent());
            pstmt.setInt(4, mbc.getRef_mcno());

            if(mbc.getRef_mcno() > 0) {

                pstmt.setInt(5, mbc.getRef_mcno());

            } else {
                pstmt.setNull(5, 0);
            }

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            close(pstmt);
        }

        return result;
    }

    // 최근 번호 가져오기
    public int selectLastMComment(Connection con) {
        int result = 0;
        Statement stmt = null;
        ResultSet rset = null;

        String sql = "SELECT MAX(MCNO) FROM MCOMMENT";

        try {

            stmt = con.createStatement();

            rset = stmt.executeQuery(sql);

            if(rset.next()) {
                result = rset.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            close(rset);
            close(stmt);
        }

        return result;
    }

    // 게시글 댓글 조회용
    public ArrayList<MBoardComment> MBCommnetList(Connection con, int mbno) {

        ArrayList<MBoardComment> list = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = "SELECT MCNO, MCCONTENT, MCDATE, USERNO, MCLEVEL, "
                + "(SELECT NICKNANE FROM MEMBER WHERE USERNO = MCOMMENT.USERNO) NICKNANE "
                + "FROM MCOMMENT "
                + "WHERE MBNO = ? AND MCOMMENT.STATUS = 'N' "
                + "START WITH MCLEVEL = 0 "
                + "CONNECT BY PRIOR MCNO = REF_MCNO";

        // NICKNAME 오타 있음 나중에 수정

        try {

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mbno);

            rset = pstmt.executeQuery();

            list = new ArrayList<>();

            while(rset.next()) {

                MBoardComment mbc = new MBoardComment();

                mbc.setMcno(rset.getInt("mcno"));
                mbc.setUserno(rset.getInt("userno"));
                mbc.setMcdate(rset.getDate("mcdate"));
                mbc.setMccontent(rset.getString("mccontent"));
                mbc.setMclevel(rset.getInt("mclevel"));

                list.add(mbc);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            close(rset);
            close(pstmt);

        }

        return list;
    }

    public int updateMComment(Connection con, MBoardComment mbco) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "UPDATE MCOMMENT SET MCCONTENT = ? WHERE MCNO = ?";

        try {

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, mbco.getMccontent());
            pstmt.setInt(2, mbco.getMcno());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            close(pstmt);
        }

        return result;
    }

    public int deleteMComment(Connection con, int mcno) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "UPDATE MCOMMENT SET STATUS = 'Y' WHERE MCNO = ?";

        try {

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mcno);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            close(pstmt);
        }

        return result;
    }
}
