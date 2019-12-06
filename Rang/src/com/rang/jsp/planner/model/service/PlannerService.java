package com.rang.jsp.planner.model.service;

import com.rang.jsp.planner.model.dao.PlannerDAO;
import com.rang.jsp.planner.model.vo.City;

import java.sql.Connection;
import java.util.ArrayList;

import static com.rang.jsp.common.JDBCTemplate.close;
import static com.rang.jsp.common.JDBCTemplate.getConnection;

public class PlannerService {
    private PlannerDAO pdao = new PlannerDAO();
    Connection con;

    public ArrayList<City> loadCity() {
        con = getConnection();

        ArrayList<City> list = pdao.loadCity(con);

        close(con);

        return list;
    }
}
