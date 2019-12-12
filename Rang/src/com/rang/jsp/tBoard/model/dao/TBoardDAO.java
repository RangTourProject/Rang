package com.rang.jsp.tBoard.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import com.rang.jsp.tBoard.model.vo.*;
import static com.rang.jsp.common.JDBCTemplate.*;

public class TBoardDAO {

	private Properties prop = new Properties();
	
	public TBoardDAO() {
		String filePath = TBoardDAO.class.getResource("/mappers/tBoard.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public int insertTboard(Connection con, TBoard b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("InsertTboard"));

			pstmt.setInt(1, b.getUserno());
			pstmt.setString(2, b.getWriter());
			pstmt.setString(3, b.getTbTitle());
			pstmt.setString(4, b.getTbContent());
			pstmt.setString(5, b.getTbfile());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO에있는 리절트값 : " + result);
		return result;
	}

	

	public ArrayList<TBoard> selectList(Connection con) {
		ArrayList<TBoard> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("TBoardList");
		
		try {
			/*
			 * pstmt = con.prepareStatement(sql);
			 * 
			 * 
			 * 
			 * rset = pstmt.executeQuery();
			 * 
			 * list = new ArrayList<TboardVO>();
			 * 기존 페이징처리했을 때 코드
			 */
			
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				TBoard tb = new TBoard();
				
				tb.setTbno(rset.getInt("tbno"));
				tb.setUserno(rset.getInt("userno"));
				tb.setWriter(rset.getString("writer"));
				tb.setTbTitle(rset.getString("tbtitle"));
				tb.setTbContent(rset.getString("tbcontent"));
				tb.setMaxmember(rset.getInt("maxmember"));
				tb.setTbcount(rset.getInt("tbcount"));
				tb.setTbfile(rset.getString("tbfile"));
				tb.setTbdate(rset.getDate("tbdate"));
				tb.setStatus(rset.getString("status"));
				
				list.add(tb);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("리스트목록 가져오는 리스트 : " + list);
		return list;
	}

	public int addReadCount(Connection con, int tbno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("addReadCount"));
			pstmt.setInt(1, tbno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public TBoard selectOne(Connection con, int tbno) {

		TBoard tb = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("SelectOne"));
			
			pstmt.setInt(1, tbno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				tb = new TBoard();
				
				tb.setTbno(tbno);
				tb.setWriter(rset.getString("writer"));
				tb.setTbTitle(rset.getString("tbtitle"));
				tb.setTbContent(rset.getString("tbcontent"));
				tb.setMaxmember(rset.getInt("maxmember"));
				tb.setTbcount(rset.getInt("tbcount"));
				tb.setTbfile(rset.getString("tbfile"));
				tb.setTbdate(rset.getDate("tbdate"));
				tb.setStatus(rset.getString("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("selectOne 값은 담기니" + tb);
		
		return tb;
	}

}
