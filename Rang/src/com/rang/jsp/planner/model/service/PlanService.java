package com.rang.jsp.planner.model.service;

import com.rang.jsp.planner.model.dao.PlanDAO;
import com.rang.jsp.planner.model.vo.City;
import com.rang.jsp.planner.model.vo.Planner;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.*;

public class PlanService {
    private PlanDAO pdao = new PlanDAO();
    Connection con;

    // 맵 로드시 기본 도시 정보 가져오기
    public ArrayList<City> loadCity() {
        con = getConnection();

        ArrayList<City> list = pdao.loadCity(con);

        close(con);

        return list;
    }

    // ajax 플래너 체크용
    public int plannerCheck(int userno) {

        con = getConnection();

        int result = pdao.plannerCheck(con, userno);

        close(con);

        return result;
    }

    // 저장된 플래너가 없을 경우 새로운 플래너
    public HashMap<String, Object> newPlanlogic(Planner p) {

        con = getConnection();

        HashMap<String, Object> hmap = null;

        // 플래너 정보 insert
        int result = pdao.insertPlanner(con, p);

        if(result > 0 ){
            // 인서트 성공

            commit(con);

            Planner plan = pdao.selectOnePlanner(con, p.getUserno());
            ArrayList<City> cityList = pdao.loadCity(con);

            hmap = new HashMap<>();

            hmap.put("planner" , plan);
            hmap.put("cityList", cityList);

        }else rollback(con);

        close(con);

        return hmap;
    }

    // 저장된 값이 있을 경우
    public HashMap<String, Object> readPlanlogic(int userno) {

        con = getConnection();

        HashMap<String, Object> hmap = null;

        Planner plan = pdao.selectOnePlanner(con, userno);
        ArrayList<City> cityList = pdao.loadCity(con);

        hmap = new HashMap<>();

        hmap.put("planner" , plan);
        hmap.put("cityList", cityList);

        close(con);

        return hmap;
    }
}
