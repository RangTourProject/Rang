package com.rang.jsp.map.controller;

import com.rang.jsp.map.model.service.MapService;
import com.rang.jsp.planner.model.vo.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/loadmap")
public class LoadingMapServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<City> list = new ArrayList<>();

        list = new MapService().loadCity();

        if(list != null){

            request.setAttribute("cityList" , list);
            request.getRequestDispatcher("views/planner/map.jsp").forward(request, response);
        }else {
            response.sendRedirect("errorPage.jsp");
        }


    }
}
