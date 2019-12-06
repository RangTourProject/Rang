package com.rang.jsp.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
    public static Connection getConnection(){
        Connection con = null;

        try{
            // context 로 부터 정보를 가져온다
            Context context = new InitialContext();

            // context. 으로 가져온 오브젝트를 DataSource로 다운 캐스팅
            DataSource ds = (DataSource)context.lookup("java:comp/env/oracleDB");

            con = ds.getConnection(); // 위로부터 가져온 정보를 con에  담는다

            con.setAutoCommit(false); // jsp 는 기본적으로 오토 커밋
            // 따라서 오토커밋이 자동으로 작동되지 못하게 하려면 setAutoCommit(false); 로 지정해야 한다.

        }catch (SQLException | NamingException e){
            e.printStackTrace(); // SQL 오류 발생시 오류 출력
        }
        return con;
    }

    // close 를 위한 메소드
    public static void close(Connection con) {
        try {
            if(!con.isClosed()) { // 이미 닫혀있지 않다면 close
                con.close();
            }
        } catch(SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void close(Statement stmt) {
        try {
            if(!stmt.isClosed()) {
                stmt.close();
            }
        } catch(SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void close(ResultSet rset) {
        try {
            if(!rset.isClosed()) {
                rset.close();
            }
        } catch(SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void commit(Connection con) {
        try {
            if(!con.isClosed()) {
                con.commit();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void rollback(Connection con) {
        try {
            if(!con.isClosed()) {
                con.rollback();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
