package com.rang.jsp.map.model.service;

import com.rang.jsp.map.model.dao.MapDAO;
import com.rang.jsp.planner.model.vo.City;

import java.sql.Connection;
import java.util.ArrayList;

import static com.rang.jsp.common.JDBCTemplate.getConnection;

public class MapService {
    Connection con;

    // 맵 로드시 기본 도시 정보 가져오기
    public ArrayList<City> loadCity() {
        con = getConnection();

        ArrayList<City> list = null;

        list = new MapDAO().loadCity(con);

        return list;
    }
}
