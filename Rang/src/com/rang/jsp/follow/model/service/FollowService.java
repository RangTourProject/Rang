package com.rang.jsp.follow.model.service;

import static com.rang.jsp.common.JDBCTemplate.close;
import static com.rang.jsp.common.JDBCTemplate.commit;
import static com.rang.jsp.common.JDBCTemplate.getConnection;
import static com.rang.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import com.rang.jsp.follow.model.dao.FollowDAO;

public class FollowService {
	Connection con ;
	FollowDAO fDao = new FollowDAO();
			
	public int followInsert(int follower, int following) {
		int result = 0;		
		con = getConnection();
		
		System.out.println("서비스 도착 !");
		
		result = fDao.followInsert(con, follower, following);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int followCheck(int me, int mb) {
		con = getConnection();
		
		int result = fDao.followCheck(con, me, mb);
		
		close(con);
		
		return result;
	}

	public Map<String, Integer> followLogic(int memno, int target_memno) {
		HashMap<String, Integer> map = new HashMap<>();
		int result = 0;		
		
		con = getConnection();
		
		System.out.println("서비스 도착 !");
		int check = fDao.followCheck(con, memno, target_memno);
		
		if(check == 0) {
			result = fDao.followInsert(con, memno, target_memno);
			map.put("follow", 0);
		} else {
			result = fDao.followDelete(con, memno, target_memno);
			map.put("follow", 1);
		}
		
		if(result > 0) commit(con);
		else {
			rollback(con);
			map.put("follow", -1);
		}
		
		close(con);
		
		return map;
	}

	// 나를 팔로우 한 사람
	public int followerCheck(int userno) {
		int result = 0;
		con = getConnection();
		
		result = fDao.followerCheck(con, userno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	// 내가 팔로우 한 사람
	public int followingCheck(int userno) {
		int result = 0;
		con = getConnection();
		
		result = fDao.followingCheck(con, userno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

}
