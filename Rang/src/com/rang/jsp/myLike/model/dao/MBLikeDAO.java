package com.rang.jsp.myLike.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.rang.jsp.common.JDBCTemplate.*;

import com.rang.jsp.myLike.model.vo.MbLike;

public class MBLikeDAO {
	
	
	/*
	 * public int insertMbLike(Connection con, MbLike ml) { int result = 0;
	 * PreparedStatement pstmt = null;
	 * 
	 * System.out.println(ml);
	 * 
	 * String sql = "INSERT INTO MBLIKE VALUES( ? , ? )";
	 * 
	 * try { pstmt = con.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, ml.getUserNo()); pstmt.setInt(2, ml.getmBno());
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace();
	 * 
	 * } finally { close(pstmt); }
	 * 
	 * return result; }
	 */
	
	// 메인 게시글 좋아요 숫자 불러올 메소드
	public int MbLikeCount(Connection con, MbLike ml) {
		int count = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = "SELECT COUNT(*) FROM MBLIKE WHERE MBNO = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ml.getmBno());
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}

	// 이미 좋아요를 눌렀는지 체크
	public int myLikeCheck(Connection con, int memno, int mbno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql= "SELECT COUNT(*) FROM MBLIKE " + 
				"WHERE USERNO = ? AND MBNO = ?";
		
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
	
	// 좋아요 눌렀을 시 
	public int insertMbLike(Connection con, int memno, int mbno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO MBLIKE VALUES(?, ?)";
		
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
	
	// 좋아요 취소했을 시
	public int deleteMbLike(Connection con, int memno, int mbno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM MBLIKE WHERE USERNO = ? AND MBNO = ?";
		
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
	
	// 메인게시글 좋아요 수 조회
	public int mBoardLikeCount(Connection con, int mbno) {
		int likeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT COUNT(*) FROM MBLIKE WHERE MBNO = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mbno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likeCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return likeCount;
	}

	

}