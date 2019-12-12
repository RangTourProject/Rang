package com.rang.jsp.planner.controller;

import com.rang.jsp.planner.model.service.PlannerService;
import com.rang.jsp.planner.model.vo.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/planner.do")
public class PlannerOpenServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<City> list = new ArrayList<>();

        PlannerService ps = new PlannerService();
        list = ps.loadCity();

    }
}
