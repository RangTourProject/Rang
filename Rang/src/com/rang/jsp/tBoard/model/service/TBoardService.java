package com.rang.jsp.tBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.*;

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

	public ArrayList<TBoard> selectList() {
		con = getConnection();

		ArrayList<TBoard> List = tbdao.selectList(con);

		close(con);

		return List;
	}

	public TBoard selectOne(int tbno) {
		con = getConnection();

		/*
		 * 게시글 카운트 용 나중에 추가 
		 * int result = tbdao.addReadCount(con, tbno);
		 * 
		 * TboardVO tb = null;
		 * 
		 * if(result > 0) { tb = tbdao.selectOne(con, tbno);
		 * 
		 * if(tb != null) commit(con); }
		 */

		TBoard tb = tbdao.selectOne(con, tbno);
		
		close(con);
		return tb;
	}

}
