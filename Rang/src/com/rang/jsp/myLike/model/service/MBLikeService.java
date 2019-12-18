package com.rang.jsp.myLike.model.service;

import com.rang.jsp.myLike.model.dao.MBLikeDAO;
import com.rang.jsp.myLike.model.vo.MbLike;
import static com.rang.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MBLikeService {
	Connection con;
	MBLikeDAO mlDao = new MBLikeDAO();
	
	/*
	 * public int insertMbLike(MbLike ml) { con = getConnection(); // 좋아요 숫자 가져올 dao
	 * 실행 int count = 0;
	 * 
	 * // 좋아요 추가할 dao 실행 int result = mlDao.insertMbLike(con, ml);
	 * 
	 * // 인서트 실행 시 좋아요 숫자 조회 메소드 실행 if(result > 0) { count = mlDao.MbLikeCount(con,
	 * ml); if(count > 0) commit(con);
	 * 
	 * } else { rollback(con); } return count; }
	 */
	
	// check와 좋아요 성공/취소를 담기위한 Map 사용
	public Map<String, Integer> myLikeLogic(int memno, int mbno) {
		HashMap<String, Integer> map = new HashMap<>();
		int result = 0;		
		
		con = getConnection();
		
		System.out.println("서비스 도착 !");
		int check = mlDao.myLikeCheck(con, memno, mbno);
		
		if(check == 0) {
			result = mlDao.insertMbLike(con, memno, mbno);
			map.put("myLike", 0);
		} else {
			result = mlDao.deleteMbLike(con, memno, mbno);
			map.put("myLike", 1);
		}
		
		if(result > 0) commit(con);
		else {
			rollback(con);
			map.put("myLike", -1);
		}
		
		close(con);
		
		return map;
	}

	// 게시글 좋아요 숫자 조회
	public int mBoardLikeCount(int mbno) {
		int likeCount = 0;
		con = getConnection();
		
		likeCount = mlDao.mBoardLikeCount(con, mbno);
		
		close(con);
		
		return likeCount;
	}


	// 사용자가 이미 좋아요를 눌렀는지 안눌렀는지 조회하는 check 
	public int myLikeCheck(int memno, int mbno) {
		int result = 0;
		con = getConnection();
		
		result = mlDao.myLikeCheck(con, memno, mbno);
		
		return result;
	}
	
	
	// 좋아요 누른 사용자 조회
	
	public ArrayList<MbLike> MBLlist(int mbno) {

        con = getConnection();

        ArrayList<MbLike> MBLlist = mlDao.MBLlist(con, mbno);

        close(con);

        return MBLlist;

    }

	

}

