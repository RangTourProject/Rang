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
import java.util.Properties;

import com.rang.jsp.member.model.vo.Member;
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
			pstmt.setInt(5, b.getMaxmember());
			pstmt.setString(6, b.getTbfile());
			pstmt.setString(7, b.getPlace());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

	public ArrayList<TBoard> selectList(Connection con, int startRow, int endRow) {
		ArrayList<TBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("TBoardList");
		
		try {
		
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
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
				tb.setPlace(rset.getString("place"));
				tb.setMaxmember(rset.getInt("maxmember"));
				tb.setMinmember(rset.getInt("minmember"));
				tb.setTotalmember(rset.getInt("TBMEMBER_COUNT")); // 쿼리 확인 후 수정
				
				list.add(tb);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("리스트목록 가져오는 리스트 : " + list);
		return list;
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
		
		
		return tb;
	}

	public int updateTBoard(Connection con, TBoard tb) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("updateTboard"));

			pstmt.setString(1, tb.getTbTitle());
			pstmt.setString(2, tb.getTbContent());
			pstmt.setString(3, tb.getTbfile());
			pstmt.setInt(4, tb.getTbno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO에있는 리절트값 : " + result);
		return result;
	}

	public int deleteTBoard(Connection con, int tbno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("deleteTBoard"));
			pstmt.setInt(1, tbno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("ListCount");
		
		try{
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public int joinParty(Connection con, int userNo, int tbno) {
		// TODO Auto-generated method stub
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "insert into tboardmember values(? , ?)";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, tbno);
			
			result = pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<TBoard> TBListPartyCount(Connection con) {
		
		
		ArrayList<TBoard> plist = null;
		
		TBoard t = null;
		
		Statement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			String sql = "SELECT T.*, NVL((SELECT COUNT(*) FROM TBOARDMEMBER TB WHERE TB.TBNO = T.TBNO GROUP BY TB.TBNO), 0) TBMEMBER_COUNT FROM TBOARD T";
			
			pstmt = con.createStatement();
			
			rset = pstmt.executeQuery(sql);
			
			plist = new ArrayList<TBoard>();
			
			while(rset.next()) {
				
				TBoard tb = new TBoard();
				
				tb.setTbno(rset.getInt("TBNO"));
				tb.setWriter(rset.getString("writer"));
				tb.setTbTitle(rset.getString("tbtitle"));
				tb.setTbContent(rset.getString("tbcontent"));
				tb.setMaxmember(rset.getInt("maxmember"));
				tb.setTbcount(rset.getInt("tbcount"));
				tb.setTbfile(rset.getString("tbfile"));
				tb.setTbdate(rset.getDate("tbdate"));
				tb.setStatus(rset.getString("status"));
				
				tb.setTotalmember(rset.getInt("TBMEMBER_COUNT")); // 쿼리 확인 후 수정
				
				plist.add(t);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		
		return plist;
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
	
	

	public int checkParty(Connection con, int userNo, int tbno) {
		
		int checkParty = 0;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

			try {
				
				pstmt= con.prepareStatement(prop.getProperty("checkParty"));
				
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, tbno);
				
				rset = pstmt.executeQuery();
				
				
				if(rset.next()) {
					checkParty = rset.getInt(1);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
				
			}
			return checkParty;
		
	}
	
	

}
