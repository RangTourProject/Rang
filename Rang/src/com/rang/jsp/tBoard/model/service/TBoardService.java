package com.rang.jsp.tBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;


import static com.rang.jsp.common.JDBCTemplate.*;

import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.tBoard.model.dao.TBoardDAO;
import com.rang.jsp.tBoard.model.vo.TBoard;

public class TBoardService {

	private TBoardDAO tbdao = new TBoardDAO();

	Connection con;

	public int insertTboard(TBoard b) {
		con = getConnection();

		int result = tbdao.insertTboard(con, b);

		System.out.println("tboard서비스에있는" + result);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;

	}

	public ArrayList<TBoard> selectList(int currentPage, int limit) {
		con = getConnection();

		int startRow = (currentPage - 1) * limit;
		int endRow = startRow + 10;
		
		ArrayList<TBoard> List = tbdao.selectList(con, startRow, endRow);

		close(con);

		return List;
	}
	// 게시글 하나 가져오기 
	public TBoard selectOne(int tbno) {
		con = getConnection();

		TBoard tb = tbdao.selectOne(con, tbno);
		
		int result = tbdao.addReadCount(con, tbno);
		if(result > 0) {
			tb = tbdao.selectOne(con, tbno);
			if(tb != null) commit(con);
		}
		else rollback(con);
		
		close(con);
		return tb;
	}

	public int updateTBoard(TBoard tb) {
		con = getConnection();
		
		int result = tbdao.updateTBoard(con, tb);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		
		
		
		
		return result;
	}
	public TBoard updateView(int tbno) {
		con = getConnection();


		TBoard tb = tbdao.selectOne(con, tbno);
		
		close(con);
		return tb;
	}
	public int deleteTBoard(int tbno) {
		con = getConnection();
		
		int result = tbdao.deleteTBoard(con, tbno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public int getListCount() {
		con = getConnection();
		
		int result = tbdao.getListCount(con);
		
		close(con);
		
		return result;
	}

	// 파티 참여용
	public int joinParty(int userNo, int tbno) {
		// TODO Auto-generated method stub
		con = getConnection();
		
		int result = tbdao.joinParty(con, userNo, tbno);
		
		if(result >0) {
			commit(con);
		}rollback(con);
		
		close(con);
		
		return result;
	}

	// 리스트 전체의 파티원 조회용
	public ArrayList<TBoard> TBListPartyCount() {
		
		con = getConnection();
		
		ArrayList<TBoard> plist = tbdao.TBListPartyCount(con);
		
		close(con);
		
		return plist;
	}

	// 사용자가 참여하기를 눌렀는지 조회
	public int checkParty(int userNo, int tbno) {
		con = getConnection();
		
		int checkParty = tbdao.checkParty(con, userNo, tbno);
		
		if(checkParty >0) {
			commit(con);
		}rollback(con);
		
		close(con);
		
		return checkParty;
		
	}

	

}
