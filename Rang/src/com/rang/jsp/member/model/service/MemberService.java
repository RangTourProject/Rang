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

    public int updateMember(Member m) {
        con = getConnection();

        int result = mdao.updateMember(con, m);

        if(result > 0){
            commit(con);
        }else rollback(con);

        close(con);

        return result;

    }

    public int deleteMember(int userNo) {

        con = getConnection();

        int result = mdao.deleteMember(con, userNo);

        if(result >0) commit(con);
        else rollback(con);

        close(con);

        return result;
    }

    public int idDupCheck(String email) {
        con = getConnection();

        int result = mdao.idDupCheck(con, email);

        close(con);

        return result;
    }

    public Member findId(Member m) {
        con = getConnection();
        Member result = mdao.findId(con, m);

        close(con);

        return result;
    }

    public int findPwd(Member m) {
        con = getConnection();
        int result = mdao.findPwd(con, m);

        close(con);

        return result;
    }


}
