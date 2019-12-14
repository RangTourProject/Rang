package com.rang.jsp.follow.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rang.jsp.member.model.vo.Member;

import static com.rang.jsp.common.JDBCTemplate.*;

public class FollowDAO {

	public int followInsert(Connection con, int memno, int target_memno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO FOLLOW VALUES(?, ?)";
		
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, memno);
			pstmt.setInt(2, target_memno);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
	}

	public int followCheck(Connection con, int me, int mb) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql= "SELECT COUNT(*) FROM follow " + 
				"WHERE memno = ? AND target_memno = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, me);
			pstmt.setInt(2, mb);
			
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

	public int followDelete(Connection con, int memno, int target_memno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM FOLLOW WHERE memno = ? AND target_memno = ?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, memno);
			pstmt.setInt(2, target_memno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
		
	}

	// 나를 팔로우 한 사람
	public int followerCheck(Connection con, int userno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT COUNT(*) FROM FOLLOW WHERE target_memno  = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userno);
			
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

	// 내가 한 사람
	public int followingCheck(Connection con, int userno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mb = new Member();
		String sql = "SELECT COUNT(*) FROM FOLLOW WHERE memno = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userno);
			
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

}
