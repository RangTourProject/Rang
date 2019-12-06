package com.rang.jsp.member.model.service;

import com.rang.jsp.member.model.dao.MemberDAO;
import com.rang.jsp.member.model.vo.Member;

import java.sql.Connection;

import static com.rang.jsp.common.JDBCTemplate.*;

public class MemberService {
    private MemberDAO mdao = new MemberDAO();
    Connection con = null;


    // 회원 가입용 메소드
    public int insertMember(Member m) {
        con = getConnection();

        int result = mdao.insertMember(con, m);

        if(result >0){
            commit(con);
        }else rollback(con);

        close(con);

        return result;
    }

    public Member selectOne(Member m) {

        con = getConnection();

        Member mb = mdao.selectOne(con, m);

        if(mb != null){
            commit(con);
        }else rollback(con);

        close(con);

        return mb;
    }
}
