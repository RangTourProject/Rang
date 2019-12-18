package com.rang.jsp.planner.model.dao;

import com.rang.jsp.planner.model.vo.City;
import com.rang.jsp.planner.model.vo.CityPlan;
import com.rang.jsp.planner.model.vo.Planner;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.close;

public class PlanDAO {

    // 도시 정보 불러오기
    public ArrayList<City> loadCity(Connection con) {

        ArrayList<City> list = null;

        Statement stmt = null;
        ResultSet rset = null;

        try{

            String sql = "select * from city";

            stmt = con.createStatement();
            rset = stmt.executeQuery(sql);

            list = new ArrayList<>();

            while (rset.next()){

                City c = new City();
                c.setCity_name(rset.getString(1));
                c.setLat(rset.getFloat(2));
                c.setLng(rset.getFloat(3));

                list.add(c);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(stmt);
        }

        return list;
    }

    // 플래너 입력
    public int insertPlanner(Connection con, Planner p) {

        int result = 0;
        PreparedStatement pstmt = null;

        try {
            String sql = "insert into Planner values(seq_plan.nextval, ?, ? ,?, to_date(?, 'YYYY-MM-DD'))";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, p.getUserno());
            pstmt.setString(2, p.getTitle());
            pstmt.setInt(3, p.getPeople());
            pstmt.setString(4, p.getStartday());

            result = pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 최근 플래너 한개 조회용
    public Planner selectOnePlanner(Connection con, int userno) {

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        Planner plan = null;

        try {

            String sql = "select * from (select * from planner where USERNO = ? ORDER BY plan_code DESC) where ROWNUM = 1";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, userno);

            rset = pstmt.executeQuery();

            if(rset.next()) {

            plan = new Planner();

            plan.setPlan_code(rset.getInt("plan_code"));
            plan.setUserno(rset.getInt("userno"));
            plan.setTitle(rset.getString("title"));
            plan.setPeople(rset.getInt("people"));
            plan.setStartday(rset.getString("startDay"));

            }

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rset);
            close(pstmt);
        }

        return plan;
    }

    // 플래너 체크용
    public int plannerCheck(Connection con, int userno) {

        int result = 0;

        PreparedStatement pstmt = null;

        try {

            String sql = "select * from (select * from planner where USERNO = ? ORDER BY plan_code DESC) where ROWNUM = 1";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, userno);

            result = pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;


    }

    // cityplan 추가용
    public int insertCityPlan(Connection con, CityPlan cp) {
        int result = 0;

        PreparedStatement pstmt = null;

        try {

            String sql = "insert into CITYPLAN values (seq_cp.nextval, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'))";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, Integer.parseInt(cp.getPlan_code()));
            pstmt.setString(2, cp.getCity_name());
            pstmt.setInt(3, cp.getDay());
            pstmt.setString(4, cp.getTrans());
            pstmt.setString(5, cp.getStartday());

            result = pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // cityplan 삭제용
    public int deleteCityPlan(Connection con, int plancode) {
        int result = 0;

        PreparedStatement pstmt = null;

        try {

            String sql = "delete from CITYPLAN where plan_code = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, plancode);

            result = pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 기존 저장된 플랜 리스트 로드용
    public ArrayList<CityPlan> loadCp(Connection con, int userno) {
        ArrayList<CityPlan> list = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try {

            String sql = "select * from CITYPLAN join planner using (plan_code) join CITY using (CITY_NAME) where USERNO = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, userno);

            rset = pstmt.executeQuery();

            list = new ArrayList<>();

            while (rset.next()){

                CityPlan cp = new CityPlan();

                cp.setPlan_code(rset.getString("plan_code"));
                cp.setCp_code(rset.getString("cp_code"));
                cp.setCity_name(rset.getString("city_name"));
                cp.setDay(rset.getInt("day"));
                cp.setTrans(rset.getString("trans"));
                cp.setStartday(rset.getString("startday"));
                cp.setUserno(rset.getString("userno"));
                cp.setLat(rset.getFloat("lat"));
                cp.setLng(rset.getFloat("lng"));

                list.add(cp);
            }

            System.out.println("list 확인 : " + list);

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(pstmt);
        }

        return list;
    }
}
