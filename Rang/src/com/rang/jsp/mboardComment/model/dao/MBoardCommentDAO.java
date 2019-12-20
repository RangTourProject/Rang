package com.rang.jsp.mboardComment.model.dao;

import com.rang.jsp.mboardComment.model.vo.MBoardComment;
import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.tBoard.model.dao.TBoardDAO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

import static com.rang.jsp.common.JDBCTemplate.close;

public class MBoardCommentDAO {

    private Properties prop = new Properties();

    public MBoardCommentDAO() {
        String filePath = TBoardDAO.class.getResource("/mappers/mBComment.properties").getPath();

        try {
            prop.load(new FileReader(filePath));
        } catch (FileNotFoundException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    // mboard 댓글 등록용
    public int insertMComment(Connection con, MBoardComment mbc) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("insertMComment");

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

        String sql = prop.getProperty("selectLastMComment");

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
                + "(SELECT NICKNAME FROM MEMBER WHERE USERNO = MCOMMENT.USERNO) NICKNAME "
                + "FROM MCOMMENT "
                + "WHERE MBNO = ? AND MCOMMENT.STATUS = 'N' "
                + "START WITH MCLEVEL = 0 "
                + "CONNECT BY PRIOR MCNO = REF_MCNO";


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
                mbc.setNickName(rset.getString("nickName"));

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

    // 게시글 수정용
    public int updateMComment(Connection con, MBoardComment mbco) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("updateMComment");

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

        String sql = prop.getProperty("deleteMComment");

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
